addpath("img/");

% creating theta
theta = zeros(13, 10);
theta(1, 4:7)=1;
theta(2, 3:8)=1;
theta(3, 2:3)=1;
theta(3, 8:9)=1;
theta(4, 2:3)=1;
theta(4, 8:9)=1;
theta(5, 2:3)=1;
theta(5, 8:9)=1;

theta(6, 1:2)=1;
theta(6, 9:10)=1;
theta(8, 1:2)=1;
theta(8, 9:10)=1;
theta(7, :)=1;

theta(13, 4:7)=1;
theta(12, 3:8)=1;
theta(11, 2:3)=1;
theta(11, 8:9)=1;
theta(10, 2:3)=1;
theta(10, 8:9)=1;
theta(9, 2:3)=1;
theta(9, 8:9)=1;


% creating structuring elements
a = zeros(3);
a(2,2)=1;
a(2,3)=1;
b = zeros(3);
b(1,2)=1;
b(2, :)=1;
b(3, 2)=1;
c= zeros(3);
c(2,2)=1;
c(3,2)=1;
d= zeros(3);
d(:,2)=1;

% name of structuring elements
ops={'a', 'b', 'c', 'd'};
% array of structuring elements
array_ops = {a, b, c, d}; % 4 ops * 2 (both erosion and dilatation)= 8

% mapping names and corresponding struc elements
dict= containers.Map(ops,array_ops);

% show them
figure;
for i=1:4
    subplot(2,2, i);
    imshow(dict(ops{i}));
    title("structuring element "+ops{i});
end
%save them
print(gcf, '-djpeg', 'structuring');


figure;
% applying both erosion and dilation for each struct el
counter =1;
for i=1:4
    subplot(4,3,counter);
    imshow(theta);
    title("Theta original");
    fprintf("operation number %d\n", i);
    op = dict(ops{i});
    %fprintf("using op %s\n%d\n", ops(i), op);
    erodedImage = imerode(theta, op);
    subplot(4,3,counter+1);
    imshow(erodedImage, []);
    drawnow;
    title("Theta eroded using "+ops(i) );
    subplot(4,3,counter+2);
    dilatedImage= imdilate(erodedImage,op );
    imshow(dilatedImage, []);
    drawnow;
    title("By applying dilation "+ops(i) );
    counter=counter+3;
end
% save them 
print(gcf, '-djpeg', 'morphA');




