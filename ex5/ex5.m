%im=imread("delicate_arch.jpg");
im=imread("graz.png");
im=double(im)./255;


kernel_size = 101;  
sigmaX=25;
sigmaY=1;
angle=45;
myGF=myGaussianFilter(kernel_size,sigmaX,sigmaY,angle)

new = imfilter(im,myGF);

figure
imshow(new);

function [gaussian_filter] = myGaussianFilter(kernel_size, sigmaX,sigmaY,angle)
    gaussian_filter=zeros(kernel_size,kernel_size);
    for i=1:kernel_size
        for j=1:kernel_size
            x=i-ceil(kernel_size/2);
            y=j-ceil(kernel_size/2);
            xr = x*cos(angle)-y*sin(angle);
            yr = x*sin(angle)+y*cos(angle);
            gaussian_filter(i,j)=exp(-((xr^2)/(2*sigmaX^2) + (yr^2)/(2*sigmaY^2)));
            
        end
    end

    figure
    imshow(imresize(gaussian_filter, 10, 'nearest'));
    %imshow(gaussian_filter);
    gaussian_filter = gaussian_filter ./ sum(gaussian_filter(:));
   
end

