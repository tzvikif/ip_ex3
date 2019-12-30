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