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


B =zeros(3);
dict=containers.Map();
counter=1;
% creating dict of structuring elements with just one foreground pixel each
for i =1:3
    for j=1:3
        b_temp = B;
        b_temp(i, j)=1;
        dict(string(counter))=b_temp;
        counter=counter+1;
    end
end
% show them
figure;
for i=1:9
    subplot(3,3, i);
    imshow(dict(string(i)));
    title("structuring element "+i);
end
counter =1;
figure;
% applying erosion to each struct el
for i=1:9
    subplot(3,3,counter);
    
    op = dict(string(i));
    %fprintf("using op %s\n%d\n", ops(i), op);
    erodedImage = imerode(theta, op);
    subplot(3,3,counter);
    imshow(erodedImage, []);
    drawnow;
    title("Theta eroded using "+i );
    
    counter=counter+1;
end


%print(gcf, '-djpeg', 'structuring');
