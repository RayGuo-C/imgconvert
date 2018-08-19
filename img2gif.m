% put the image transformed into animated gif
A = imread('');
B = imread('');
ImageCell = {A;B}

% Create file name.
FileName = 'Animation.gif';

for k = 1:numel(ImageCell)
  
    if k == 1 
        imwrite(ImageCell{k},FileName,'gif','LoopCount',Inf,'DelayTime',1);
    else 
        imwrite(ImageCell{k},FileName,'gif','WriteMode','append'); 
    end 
end