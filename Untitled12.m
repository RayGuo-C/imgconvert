
A = imread('I:\fracture_mechanics_2018-8-15\U-shape-thin\Data\ext_orig\1\Z1slice_1.bmp');
B = imread('I:\fracture_mechanics_2018-8-15\U-shape-thin\Data\ext_orig\1\Z1slice_2.bmp');
ImageCell = {A;B}
%// Create file name.
FileName = 'Animation.gif';
for k = 1:numel(ImageCell)
   text_str = [num2str(k)];
   position = [1000 300]; 
   box_color = {'black'};
   rgb{k} = insertText(ImageCell{k},position,text_str,'FontSize',80,'BoxColor',...
   box_color,'BoxOpacity',0.4,'TextColor','white');
   if k == 1 
%// For 1st image, start the 'LoopCount'.
        imwrite(rgb{k},FileName,'gif','LoopCount',Inf,'DelayTime',1);
    else 
        imwrite(rgb{k},FileName,'gif','WriteMode','append'); 
    end 
end