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