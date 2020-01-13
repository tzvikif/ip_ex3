%{
This function applies Bilateral Filtering to the given image.
Bilateral filtering replaces each pixel with a weighted average of its neighbors where
the weights are determined according to the spatial and photometric (intensity) distances.

Inputs:
im - grayscale image (array of values in [0..255])
radius – the radius of the neighborhood (neighborhood is square).
stdSpatial – the std of the Gaussian function used for the spatial weight.
stdIntensity – the std of the Gaussian function used for the intensity weight.

Output:
cleanIm - grayscale image (array of values in [0..255])  - the filtered image.

 Method:    Per pixel, determine the local mask based on spatial and photometric weights.
            Normalize the mask appropriately (image average should remain approx the same).
            Scan the rows and cols of the image, but per each pixel use matrix ops (no loops).
            Set the boundary pixels (pixels where the neighborhood extends
            beyond the bounds of the image) to zero. Do not use matlab function bfilter.
%}
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
end