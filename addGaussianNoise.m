function noisyIm = addGaussianNoise(im, s) 
    noise = random('normal',0,s,size(im));
    noisyIm = im + noise;
end