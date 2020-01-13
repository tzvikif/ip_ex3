%{
Denoises image using mean filtering.

   Input:   im - a grayscale image array in the range [0..255].
            radius – the radius of the filtering mask. Filtering mask is square.
            Thus window at location r,c is coordinated: [r-radius:r+radius,c-radius:c+radius]
            maskSTD  - the std of the Gaussian mask.
   Output:   cleanIm - grayscale image in the range [0..255] same size as im.
   Method:  Convolve image with Gaussian mask.
                  Use matlab function conv2.
                  Use the Gaussian formula: exp(-x.^2/(2*std^2)-y.^2/(2*std^2))
                  (have x and y run –radius:radius).
%}
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