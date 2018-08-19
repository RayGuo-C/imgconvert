I = imread(' .bmp');
% write the letter or other text on the  at the specified color of background box. 
k = 15;specified position
text_str = [num2str(k)]; % the content you want to write 
position = [1000 300]; %  letter or other text
box_color = {'black'}; % specified color of background
RGB = insertText(I,position,text_str,'FontSize',80,'BoxColor',...
    box_color,'BoxOpacity',0.4,'TextColor','white');
figure
imshow(RGB)