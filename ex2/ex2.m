
im=imread("delicate_arch.jpg");
im=double(im)./255;
figure
imshow(im)
sigma=1;
gamma=2;
H = fspecial("gaussian",4*sigma+1,sigma);

blur = imfilter(im,H);
result = im + gamma*(im-blur);
figure
imshow(result)

%
H=-H*gamma
% Find the center index
center_index = ceil(size(H)/2);

% Set the value at the center index
H(center_index(1), center_index(2)) = H(center_index(1), center_index(2))+1+(1*gamma)

new = imfilter(im,H);

figure
imshow(new)

mse = mean((result - new).^2, 'all')

