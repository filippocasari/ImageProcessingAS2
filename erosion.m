function[eroded_image] = erosion(image, structure)
    eroded_image = zeros(size(image));


    padded_image=padarray(image, [1 1], 1, 'both');
    %imtool(imresize(padded_theta, 100));
    % Perform erosion on the binary image using the structuring element
    for i = 2:size(padded_image, 1)-1
        for j = 2:size(padded_image, 2)-1
            % Apply the structuring element to the current pixel and its neighbors
            
            if(isequal(padded_image(i-1:i+1, j-1:j+1),structure))
                eroded_image(i-1, j-1)=1;
                %padded_theta(i, j)=1;
            else
                eroded_image(i-1, j-1)=0;
                %padded_theta(i, j)=0;
            end
        end
    end


end