clear;close all;

im = readImage('stroller.tif');
showImage(im);
%%
imSPnoise = addSPnoise(im,50);
showImage(imSPnoise);
%%
sigma = 10;
imGaussianNoise = addGaussianNoise(im,sigma);
showImage(imGaussianNoise);
%%
cleanedMedianIm = cleanImageMedian(im,1);
showImage(cleanedMedianIm);
%%
cleanedMeanIm = cleanImageMean(im,2,3);
showImage(cleanedMeanIm);