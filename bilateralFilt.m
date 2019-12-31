function cleanIm = bilateralFilt (im,radius,stdSpatial,stdIntensity)
    imRowSize = size(im,2);
    imColSize = size(im,1);
    cleanIm = zeros(imColSize,imRowSize);
    bigIm = zeros(imColSize+2*radius,imRowSize+2*radius);
    bigIm(1+radius:imColSize+radius,1+radius:imRowSize+radius) = im;
    sW = zeros(radius*2+1,radius*2+1);
    xcenter = 1+radius;
    ycenter = 1+radius;
    for x=1:2*radius+1
        for y=1:2*radius+1
            sW(y,x) = exp(-(xcenter-x).^2/(2*stdSpatial^2)-(ycenter-y).^2/(2*stdSpatial^2));
        end
    end
    sW = sW/sum(sW,'all');    % preserve mean
    %pW = zeros(2*radius+1,2*radius+1);
    for x=1+radius:imRowSize+radius
        for y=1+radius:imColSize+radius
            centerColor = bigIm(y,x);
            photometricDist = ...
                centerColor*ones(2*radius+1,2*radius+1)-bigIm(x-radius:x+radius,y-radius:y+radius);
            pW = exp(-(photometricDist).^2/(2*stdIntensity^2));
            I = sW * pW' * bigIm(x-radius:x+radius,y-radius:y+radius);
            normalizationFactor = sum(sW * pW','all');
            I = sum(I,'all')/normalizationFactor;
            cleanIm(y,x) = I;
        end
    end
end