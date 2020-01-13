%{
Adds Salt & Pepper noise to image
   Input:   im - a grayscale image array in the range [0..255]. 
            p  - proportion of pixels that will be noisy

   Output:   NoisyIm - grayscale image in the range [0..255] same size as im

   Method:  p/2 pixels are randomly chosen as 0 and p/2 as 255. Do not loop over
                  image pixels. Use matlab function rand. Do not loop over pixels.
 %}
function noisyIm = addSPnoise(im, p)
    imRowSize = size(im,2);
    imColSize = size(im,1);
    noisyIm = im(:);
    indices = randperm(imRowSize*imColSize,p);
    pepperIndices = indices(1:p/2);
    saltIndices = indices(p/2+1:end);
    noisyIm(pepperIndices) = 0;
    noisyIm(saltIndices) = 255;
    noisyIm = reshape(noisyIm,imColSize,imRowSize);
end