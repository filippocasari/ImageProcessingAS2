
I = imread('delicate_arch.jpg');
%I= double(I).^2.2;
I_ycbcr = rgb2ycbcr(double(I)./255);   I_gray = double(rgb2gray(I))./255;

%from doc
%patch = imcrop(I,[170, 35, 50 50]);
patch = imcrop(I,[600, 600, 50 50]);
figure
imshow(patch)
patchVar = std2(patch)^2;
DoS = 2*patchVar

sigma= 3; 
% Apply the bilateral filter using imbilatfilt
result = imbilatfilt(I_gray, DoS, sigma);


%mask = imbinarize(I_gray - result,0);
%mask=imcomplement(imbinarize(filtered_img, 0));

mask = imbinarize(int8(edge(result,'canny')));
%mask = imbinarize(int8(edge(result,'prewitt')));
%mask = imbinarize(int8(edge(result,"log")));



SE = strel('disk', 2);
SE1 = strel('disk', 1);
%SE = strel('cube', 3);
disp(SE)

mask = imdilate(mask,SE);
mask = imerode(mask,SE1);


mask = imcomplement(mask);
figure
imshow(mask);
title('Filtered Image');

J_ycbcr = cat(3,result,I_ycbcr(:,:,2),I_ycbcr(:,:,3)); J_rgb = ycbcr2rgb(J_ycbcr);   

figure;

imshow(I);
title('Original Image');
figure
imshow(J_rgb);
title('Filtered Image');
new_im = (1-mask).*0 + mask.*J_rgb;
figure
imshow(new_im);
