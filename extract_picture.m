function extract_picture
%for i = 1:15
%   a=strcat('F:\Experiment\ext_data\ext_data_1\L\t_',num2str(i),'.tif');
%   I=imread(a);
%   imwrite(I,['F:\Experiment\ext_data\ext_data_1\L\tinserttext_',num2str(i),'.bmp']);
%end
file_path =  'F:\Experiment\ext_data\ext_data_1\L_text\'; % image folder path
img_path_list = dir(strcat(file_path,'*.bmp')); % capture all of the bmp format image in the specified folder
img_num = length(img_path_list); % get the total number of images
for i = 1:img_num
    a=strcat(file_path,'l_',num2str(i),'.bmp');
    I{i} = imread(a);
    imshow(I{i});
end
imwrite(I{i},[file_path,num2str(i),'.tif']);