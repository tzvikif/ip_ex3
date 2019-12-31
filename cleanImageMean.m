function cleanIm = cleanImageMean (im, radius, maskSTD)
    %cleanIm = zeros(imColSize,imRowSize);
    mask = zeros(radius*2+1,radius*2+1);
    xcenter = 1+radius;
    ycenter = 1+radius;
    for x=1:2*radius+1
        for y=1:2*radius+1
            mask(y,x) = exp(-(xcenter-x).^2/(2*maskSTD^2)-(ycenter-y).^2/(2*maskSTD^2));
        end
    end
    mask = mask/sum(mask,'all');    % preserve mean
    cleanIm = conv2(im,mask);
end