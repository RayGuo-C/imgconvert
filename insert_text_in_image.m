
for i = 1:15
    a=strcat('F:\Experiment\ext_data\ext_data_1\TK\tk_',num2str(i),'.tif');
    I=imread(a);
    k = i; % specified position
    text_str = [num2str(k)]; % the content you want to write 
    position = [1048 300]; %  letter or other text
    box_color = {'black'}; % specified color of background
    RGB = insertText(I,position,text_str,'FontSize',100,'BoxColor',...
    box_color,'BoxOpacity',0.5,'TextColor','white');
    imwrite(RGB,['F:\Experiment\ext_data\ext_data_1\TK_text\tk_',num2str(i),'.bmp']);
end
     