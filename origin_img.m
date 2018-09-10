function [I,img_num] = origin_img(file_path) 
 % image folder path
img_path_list = dir(strcat(file_path,'*.tif')); % capture all of the bmp format image in the specified folder
img_num = length(img_path_list); % get the total number of images
I = cell(1,img_num);
for i = 1:img_num
    a=strcat(file_path,'t_',num2str(i),'.tif');
    I{i} = imread(a);
end
%imwrite(I{i},[file_path,num2str(i),'.tif']);