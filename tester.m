clear;close all;

im = readImage('stroller.tif');
showImage(im);
%%
imSPnoise = addSPnoise(im,300);
showImage(imSPnoise);
%%
sigma = 10;
imGaussianNoise = addGaussianNoise(im,sigma);
showImage(imGaussianNoise);
%%
cleanedMedianIm = cleanImageMedian(im,20);
showImage(cleanedMedianIm);
%%
cleanedMeanIm = cleanImageMean(im,2,3);
showImage(cleanedMeanIm);
%%
stdSpatial = 2;
stdIntensity = 4;
radius = 2;
cleanedBifi = bilateralFilt(imGaussianNoise,radius,stdSpatial,stdIntensity);
showImage(cleanedBifi);

