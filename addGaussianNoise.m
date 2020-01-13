%{
Adds Gaussian noise to image
   Input:   im - a grayscale image array in the range [0..255]. 
            s  - the std to be used for Gaussian distribution of noise

   Output:   NoisyIm - grayscale image in the range [0..255] same size as im

   Method:  For every pixel add a random value with is chosen from a Gaussian distribution
                  of std s. Do not loop over image pixels. Use matlab function randn.
%}
function noisyIm = addGaussianNoise(im, s) 
    noise = random('normal',0,s,size(im));
    noisyIm = im + noise;
end