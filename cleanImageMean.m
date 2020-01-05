function cleanIm = cleanImageMean (im, radius, maskSTD)
    %cleanIm = zeros(imColSize,imRowSize);
    %mask = zeros(radius*2+1,radius*2+1);
    %xcenter = 1+radius;
    %ycenter = 1+radius;
    spatialMask = zeros(radius*2+1,radius*2+1);
    for x=-radius:radius
        for y=-radius:radius
            spatialMask(x+radius+1,y+radius+1) = exp(-x.^2/(2*maskSTD^2)-y.^2/(2*maskSTD^2));
        end
    end
    spatialMask = spatialMask/sum(spatialMask,'all');    % preserve mean
    cleanIm = conv2(im,spatialMask,'same');
end