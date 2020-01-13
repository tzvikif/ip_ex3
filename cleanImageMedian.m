%{
Denoises image using median filtering.

   Input:   im - a grayscale image array in the range [0..255].
            radius – the radius of the filtering mask. Filtering mask is square.
            Thus window at location r,c is coordinated: [r-radius:r+radius,c-radius:c+radius]

   Output:  cleanIm - grayscale image in the range [0..255] same size as im.

   Method:  Apply median filtering with neighborhood of radius maskSize.
            You may loop over the image pixels. You may used matlab function median.
            No need to compute at pixels where the neighborhood extends
            beyond the bounds of the image. Set these pixels to 0 so that cleanIm is same size as im.
%}
function cleanIm = cleanImageMedian (im, radius)
    imRowSize = size(im,2);
    imColSize = size(im,1);
    bigIm = zeros(imColSize+2*radius,imRowSize+2*radius);
    bigIm(1+radius:imColSize+radius,1+radius:imRowSize+radius) = im;
    cleanIm = zeros(imColSize,imRowSize);
    for r=1+radius:imRowSize+radius
        for c=1+radius:imColSize+radius
            mask = bigIm(r-radius:r+radius,c-radius:c+radius);
            cleanIm(r-radius,c-radius) = median(mask,'all');
        end
    end
end