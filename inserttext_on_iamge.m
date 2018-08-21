% insert text on lots of images
cd('F:\Experiment\ext_data\ext_data_1\L\');
load('filenamelist.mat');
I = imread(file_name_list(1,:));
% write the letter or other text on the  at the specified color of background box. 
for h = 1:15
    H = imadjust(imread((file_name_list(h,:))));
    i = size (I)
    h = size(H)
    length(file_name_list)
    k = 15; % specified position
    text_str = [num2str(k)]; % the content you want to write 
    position = [1000 300]; %  letter or other text
    box_color = {'black'}; % specified color of background
    RGB = insertText(H,position,text_str,'FontSize',80,'BoxColor',...
    box_color,'BoxOpacity',0.4,'TextColor','white');
    imwrite(RGB,['tinserttext_',num2str(h),'.tif']);
end
% it's necessary to understand the stract and cell