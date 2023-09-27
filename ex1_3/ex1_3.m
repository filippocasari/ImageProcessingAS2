%image=[63,63,63;63,63,63;63,63,63];
%image=[0,0,0;0,63,0;0,0,0]
image = rgb2gray(imread("delicate_arch.jpg"));
kernel = [-1,-2,-0; -2,0,3; 0,3,1]
rank(kernel)
kernel(:,2)
kernel(2,:)
kernel_approx = kernel(:,2) * kernel(2,:)

rank(kernel_approx)
K = kernel_approx;
[U, S, V] = svd(K);
k1 = U(:,1) * sqrt(S(1,1))
k2 = V(1,:) * sqrt(S(1,1))


output_img1 = conv2(image, k1, 'same');
output_img2 = conv2(image, k2, 'same');
output_img3 = output_img1 + output_img2;
output_img = conv2(image, kernel, 'same');
output_img_a = conv2(image, kernel_approx, 'same');

figure()
imshow(output_img)

%figure()
%imshow(output_img_a)

figure()
imshow(output_img3)

mse = mean((output_img - output_img3).^2, 'all')

