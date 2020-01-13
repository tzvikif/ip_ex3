%{
author: Tzvi Fisher 037580644
        Daphna Kopel 209051036
%}
clear;close all;
%% pre1 create noisy images
clear;close all;
fprintf('reading stroller.tif ...\n');
im = readImage('stroller.tif');
showImage(im);
mypause;
fprintf('create noisy S&P image ...\n');
imNoisySP = addSPnoise(im,15000);
imwrite(cast(imNoisySP,'uint8'),'imNoisySP.tiff');
showImage(imNoisySP);
mypause;
fprintf('create noisy gaussian image ...\n');
sigma = 80;
imNoisyGaussian = addGaussianNoise(im,sigma);
imwrite(cast(imNoisyGaussian,'uint8'),'imNoisyGaussian.tiff');
showImage(imNoisyGaussian);
% pre1 create low noise image
fprintf('create low noise S&P image ...\n');
mypause;
imLowNoiseSP = addSPnoise(im,4000);
imwrite(cast(imLowNoiseSP,'uint8'),'imLowNoiseSP.tiff');
showImage(imLowNoiseSP);
mypause;
fprintf('create low noise gaussian image ...\n');
sigma = 40;
imLowNoiseGaussian = addGaussianNoise(im,sigma);
imwrite(cast(imLowNoiseGaussian,'uint8'),'imLowNoiseGaussian.tiff');
showImage(imLowNoiseGaussian);
%% pre2 cleaning noisy S&P
close all;
fprintf('displaying imNoisySP...\n');
showImage(imNoisySP);
mypause;
%1
fprintf('clean noisy S&P with mean ...\n');
cleanedNoisySP_mean = cleanImageMean(imNoisySP,5,4);
imwrite(cast(cleanedNoisySP_mean,'uint8'),'cleanedNoisySP_mean.tiff');
showImage(cleanedNoisySP_mean);
mypause;
%2
fprintf('clean noisy S&P with median ...\n');
cleanedNoisySP_median = cleanImageMedian(imNoisySP,2);
imwrite(cast(cleanedNoisySP_median,'uint8'),'cleanedNoisySP_median.tiff');
showImage(cleanedNoisySP_median);
mypause;
%3 
fprintf('clean noisy S&P with bilateral filtering ...\n');
cleanedNoisySP_bifi = bilateralFilt(imNoisySP,5,3,250);
imwrite(cast(cleanedNoisySP_bifi,'uint8'),'cleanedNoisySP_bifi.tiff');

showImage(cleanedNoisySP_bifi);
%% pre2 cleaning low noise S&P
close all;
fprintf('displaying imLowNoiseSP...\n');
showImage(imLowNoiseSP);
mypause;
%4
fprintf('clean low noise S&P with mean ...\n');
cleanedLowNoiseSP_mean = cleanImageMean(imLowNoiseSP,3,10);
imwrite(cast(cleanedLowNoiseSP_mean,'uint8'),'cleanedLowNoiseSP_mean.tiff');
showImage(cleanedLowNoiseSP_mean);
mypause;
%5
fprintf('clean low noise S&P with median ...\n');
cleanedLowNoiseSP_median = cleanImageMedian(imLowNoiseSP,2);
imwrite(cast(cleanedLowNoiseSP_median,'uint8'),'cleanedLowNoiseSP_median.tiff');
showImage(cleanedLowNoiseSP_median);
mypause;
%6 
fprintf('clean low noise S&P with bilateral filtering ...\n');
cleanedLowNoiseSP_bifi = bilateralFilt(imLowNoiseSP,3,2,200);
imwrite(cast(cleanedLowNoiseSP_bifi,'uint8'),'cleanedLowNoiseSP_bifi.tiff');
showImage(cleanedLowNoiseSP_bifi);
%% pre2 cleaning noisy gaussian
%7
close all;
fprintf('displaying imNoisyGaussian...\n');
showImage(imNoisyGaussian);
mypause;
fprintf('clean noisy gaussian with mean ...\n');
cleanedNoisyGaussian_mean = cleanImageMean(imNoisyGaussian,3,4);
imwrite(cast(cleanedNoisyGaussian_mean,'uint8'),'cleanedNoisyGaussian_mean.tiff');
showImage(cleanedNoisyGaussian_mean);
mypause;
%8
fprintf('clean noisy gaussian with median ...\n');
cleanedNoisyGaussian_median = cleanImageMedian(imNoisyGaussian,3);
imwrite(cast(cleanedNoisyGaussian_median,'uint8'),'cleanedNoisyGaussian_median.tiff');
showImage(cleanedNoisyGaussian_median);
mypause;
%9 
fprintf('clean noisy gaussian with bilateral filtering ...\n');
cleanedNoisyGaussian_bifi = bilateralFilt(imNoisyGaussian,3,3,200);
imwrite(cast(cleanedNoisyGaussian_bifi,'uint8'),'cleanedNoisyGaussian_bifi.tiff');
showImage(cleanedNoisyGaussian_bifi);
%% pre2 cleaning low noise gaussian
close all;
fprintf('displaying imLowNoiseGaussian...\n');
showImage(imLowNoiseGaussian);
mypause;
%10
fprintf('clean low noise gaussian with mean ...\n');
cleanedLowNoiseGaussian_mean = cleanImageMean(imLowNoiseGaussian,4,5);
imwrite(cast(cleanedLowNoiseGaussian_mean,'uint8'),'cleanedLowNoiseGaussian_mean.tiff');
showImage(cleanedLowNoiseGaussian_mean);
mypause;
%11
fprintf('clean low noise gaussian with median ...\n');
cleanedLowNoiseGaussian_median = cleanImageMedian(imLowNoiseGaussian,3);
imwrite(cast(cleanedLowNoiseGaussian_median,'uint8'),'cleanedLowNoiseGaussian_median.tiff');
showImage(cleanedLowNoiseGaussian_median);
mypause;
%12
fprintf('clean low noise gaussian with bilateral filtering ...\n');
cleanedLowNoiseGaussian_bifi = bilateralFilt(imLowNoiseGaussian,4,2,200);
imwrite(cast(cleanedLowNoiseGaussian_bifi,'uint8'),'cleanedLowNoiseGaussian_bifi.tiff');
showImage(cleanedLowNoiseGaussian_bifi);
%% pre3
% low S&P noise
%1)
%best: median
%medium: bfl
%worst: mean
% high S&P noise
%2)
%best: median
%medium: mean
%worst: bfl
% low gaussian noise
%3)
%best: mean
%medium: bfl
%worst: median
% high gaussian noise
%4)
%best: mean
%medium: bfl
%worst: median





