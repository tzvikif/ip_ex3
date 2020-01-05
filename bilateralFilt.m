function cleanIm = bilateralFilt (im,radius,stdSpatial,stdIntensity)
    imRowSize = size(im,2);
    imColSize = size(im,1);
    cleanIm = zeros(imColSize,imRowSize);
    bigIm = zeros(imColSize+2*radius,imRowSize+2*radius);
    bigIm(1+radius:imColSize+radius,1+radius:imRowSize+radius) = im;
    sW = zeros(radius*2+1,radius*2+1);
    for x=-radius:radius
        for y=-radius:radius
            sW(x+radius+1,y+radius+1) = exp(-x.^2/(2*stdSpatial^2)-y.^2/(2*stdSpatial^2));
        end
    end
    sW = sW/sum(sW,'all');    % preserve mean
    %pW = zeros(2*radius+1,2*radius+1);
    for x=1+radius:imRowSize+radius
        for y=1+radius:imColSize+radius
            centerColor = bigIm(x,y);
            J = bigIm(x-radius:x+radius,y-radius:y+radius);
            photometricDist = centerColor*ones(2*radius+1,2*radius+1)-J;
            pW = exp(-photometricDist.^2/(2*stdIntensity^2));
            %pW = ones(2*radius+1,2*radius+1);
            I = sW .* pW .* J;
            normalizationFactor = sum(sW .* pW,'all');
            I = sum(I,'all')/normalizationFactor;
            cleanIm(x-radius,y-radius) = I;
        end
    end
    %cleanIm = cleanIm(radius+1:end,radius+1:end);
end