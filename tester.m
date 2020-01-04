clear;close all;

im = readImage('stroller.tif');
showImage(im);
%%
imSPnoise = addSPnoise(im,300);
showImage(imSPnoise);
%%
sigma = 20;
imGaussianNoise = addGaussianNoise(im,sigma);
showImage(imGaussianNoise);
%%
radius = 1
cleanedMedianIm = cleanImageMedian(imSPnoise,radius);
showImage(cleanedMedianIm);
%%
radius = 2;
sigma = 2;
cleanedMeanIm = cleanImageMean(imGaussianNoise,radius,sigma);
showImage(cleanedMeanIm);
%%
%showImage(imGaussianNoise);
stdSpatial = 5;
stdIntensity = 20;
radius = 5;
cleanedBifi = bilateralFilt(imGaussianNoise,radius,stdSpatial,stdIntensity);
showImage(cleanedBifi);
%%
showImage(imbilatfilt(imGaussianNoise));


