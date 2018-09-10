function [I,img_num] = label_img(file_path)
img_path_list = dir(strcat(file_path,'*.tif'));% capture all of the bmp format image in the specified folder
 img_num = length(img_path_list);% get the total number of images
 J = cell(1,img_num);
for i = 1:img_num
    a=strcat(file_path,'tk_',num2str(i),'.tif');
    J=imread(a);
    k = i; % specified position
    text_str = [num2str(k)]; % the content you want to write 
    position = [1048 300]; %  letter or other text
    box_color = {'black'}; % specified color of background
    I = insertText(J,position,text_str,'FontSize',100,'BoxColor',...
    box_color,'BoxOpacity',0.5,'TextColor','white');
    imwrite(I,['F:\Experiment\ext_data\ext_data_1\TK_text\tk_',num2str(i),'.bmp']);
end
     