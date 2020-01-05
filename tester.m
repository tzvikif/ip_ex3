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
%% pre1 create noisy images
clear;close all;
fprintf('reading stroller.tif ...\n');
im = readImage('stroller.tif');
showImage(im);
mypause;
fprintf('create noisy S&P image ...\n');

imNoisySP = addSPnoise(im,15000);
showImage(imNoisySP);
mypause;
fprintf('create noisy gaussian image ...\n');
sigma = 80;
imNoisyGaussian = addGaussianNoise(im,sigma);
showImage(imNoisyGaussian);
% pre1 create low noise image
fprintf('reading stroller.tif ...\n');
im = readImage('stroller.tif');
showImage(im);
mypause;
fprintf('create low noise S&P image ...\n');
imLowNoiseSP = addSPnoise(im,4000);
showImage(imLowNoiseSP);
mypause;
fprintf('create low noise gaussian image ...\n');
sigma = 40;
imLowNoiseGaussian = addGaussianNoise(im,sigma);
showImage(imLowNoiseGaussian);
%% pre2 cleaning noisy S&P
close all;
showImage(imNoisySP);
%1
fprintf('clean noisy S&P with mean ...\n');
cleanedNoisySP_mean = cleanImageMean(imNoisySP,5,4);
showImage(cleanedNoisySP_mean);
mypause;
%2
fprintf('clean noisy S&P with median ...\n');
cleanedNoisySP_median = cleanImageMedian(imNoisySP,2);
showImage(cleanedNoisySP_median);
mypause;
%3 
fprintf('clean noisy S&P with bilateral filtering ...\n');
cleanedNoisySP_bifi = bilateralFilt(imNoisySP,6,5,200);
showImage(cleanedNoisySP_bifi);
%% pre2 cleaning low noise S&P
close all;
showImage(imLowNoiseSP);
%4
fprintf('clean low noise S&P with mean ...\n');
cleanedLowNoiseSP_mean = cleanImageMean(imLowNoiseSP,3,2);
showImage(cleanedLowNoiseSP_mean);
mypause;
%5
fprintf('clean low noise S&P with median ...\n');
cleanedLowNoiseSP_median = cleanImageMedian(imLowNoiseSP,2);
showImage(cleanedLowNoiseSP_median);
mypause;
%6 
fprintf('clean low noise S&P with bilateral filtering ...\n');
cleanedLowNoiseSP_bifi = bilateralFilt(imLowNoiseSP,4,5,200);
showImage(cleanedLowNoiseSP_bifi);
%% pre2 cleaning noisy gaussian
%7
close all;
showImage(imNoisyGaussian);
fprintf('clean noisy gaussian with mean ...\n');
cleanedNoisyGaussian_mean = cleanImageMean(imNoisyGaussian,5,4);
showImage(cleanedNoisyGaussian_mean);
mypause;
%8
fprintf('clean noisy gaussian with median ...\n');
cleanedNoisyGaussian_median = cleanImageMedian(imNoisyGaussian,2);
showImage(cleanedNoisyGaussian_median);
mypause;
%9 
fprintf('clean noisy gaussian with bilateral filtering ...\n');
cleanedNoisyGaussian_bifi = bilateralFilt(imNoisyGaussian,6,5,200);
showImage(cleanedNoisyGaussian_bifi);
%% pre2 cleaning low noise gaussian
close all;
showImage(imLowNoiseGaussian);
%10
fprintf('clean low noise gaussian with mean ...\n');
cleanedLowNoiseGaussian_mean = cleanImageMean(imLowNoiseGaussian,3,2);
showImage(cleanedLowNoiseGaussian_mean);
mypause;
%11
fprintf('clean low noise gaussian with median ...\n');
cleanedLowNoiseGaussian_median = cleanImageMedian(imLowNoiseGaussian,2);
showImage(cleanedLowNoiseGaussian_median);
mypause;
%12
fprintf('clean low noise gaussian with bilateral filtering ...\n');
cleanedLowNoiseGaussian_bifi = bilateralFilt(imLowNoiseGaussian,4,5,200);
showImage(cleanedLowNoiseGaussian_bifi);
%% pre3





