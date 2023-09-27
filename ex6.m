%ex 6
clear;
clc;
close all;
image = imread("delicate_arch.jpg");
sigma =2;

% gaussian filter
B = imgaussfilt(image, sigma);
f=figure;
% perform 9 times (plus 1) gaussian filter
for i=1:9
    B = imgaussfilt(B, sigma);
end
% show results
set(f, 'Position', [100 100 1200 800]);
subplot(1,3, 1);
imshow(image);
title("original");
subplot(1,3,2);
imshow(B);
title("sigma = 2, 10 times");

%J = imbilatfilt(image,degreeOfSmoothing,spatialSigma);
% bigger gaussian filter
bigger_sigma = 6;
C= imgaussfilt(image, bigger_sigma);

subplot(1,3,3);

imshow(C);
title("sigma = 6");
figure;

% take a portion of the sky
patch = imcrop(image,[70, 50, 50 50]);
imshow(patch);

f2=figure;
set(f2, 'Position', [100 100 1200 2000]);
subplot(3,1, 1);
imshow(image);

title("original");
drawnow;
% compute variance
patchVar = std2(patch)^2;
% compute degree of Smoothing
degreeOfSmoothing=2*patchVar;
spatialSigma=6;
% bilateral filtering
J = imbilatfilt(image,degreeOfSmoothing,spatialSigma);
subplot(3,1,  2);
imshow(J);
title("sigma = 6, 1 time");
drawnow;
% performing 10 time bilateral filtering
J2 = imbilatfilt(image,degreeOfSmoothing,2);
for i=1:9
    J2 = imgaussfilt(J2, 2);
end
% plot 'em
subplot(3,1,  3);
%disp(J-image);
imshow(J2);
title("sigma: 2, 10 times" );

