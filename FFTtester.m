%% 5a
im = readImage('stroller.tif');
Fim = fft2(im);
D = log(1+abs(Fim));
D = fftshift(D);
colormap gray;
imagesc(D);
%% 5b
phase = atan(imag(Fim)./real(Fim));
phaseTest = angle(Fim);
fprintf('diff:%f\n',sum(phase-phaseTest,'all'));
colormap gray;
imagesc(phase);
%% 6 Liniarity
lena = readImage('lena.tif');
fruit = readImage('fruit.tif');

alpha = 0.3;    
beta = 0.7;
g = alpha*lena + beta*fruit;
%showImage(g);
FFTlena = fft2(lena);
FFTfruit = fft2(fruit);
G = alpha*FFTlena+beta*FFTfruit;
invG = ifft2(G);
showImage(invG);
fprintf('diff:%f\n',sum(g-invG,'all'));
%% 7 Parseval Theroem
N = size(lena,1);
M = size(lena,2);
% in image space
dc = sum(lena.*lena,'all');
DC = sum(abs(FFTlena.*FFTlena),'all')/(N*M);
fprintf('diff:%f\n',sum(dc-DC,'all'));
%% 8 cojugate-symmetric
A = randi([1 50],1,2); 
u = A(1);v=A(2);    %take any u,v
shiftedLena = fftshift(FFTlena);
c1 = shiftedLena(129+u,129+v);
c2 = shiftedLena(129-u,129-v);  %take F(-u,-v)
fprintf('real: a1=%f is equal to a2=%f.\n imaginary: b1=%f is equal to -b2=%f\n',...
    real(c1),real(c2),imag(c1),-imag(c2));
%% 9 shift preserves power spectrum
%before shift
origPower = sum(abs(FFTfruit),'all');
shiftedIm = circshift(fruit,40);    %circular shift by 10
shiftedFFT = fft2(shiftedIm);
shiftedPower = sum(abs(shiftedFFT),'all');
fprintf('diff power between original and shifted image:%f\n',origPower-shiftedPower);
%%10 
im = magic(9);
% transpose has the same effect as rotation by 90 degrees.
rotatedIm = im';
FFTim = fft2(im);
rotatedFFTim = FFTim';
sum(fft2(rotatedIm) - rotatedFFTim,'all')




