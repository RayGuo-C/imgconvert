function img2gif
% put the image transformed into animated gif
nFrames=15;
% Create file name.
% FileName = 'tk_1.gif';
for i = 1:nFrames
    a=strcat('F:\Experiment\ext_data\ext_move_2\ext_x\',num2str(i),'.tif');
    I{i}=imread(a);
    imshow(I{i},[]), axis equal, axis tight; 
    frame=getframe(gcf);  
    im=frame2im(frame);% it's necessary to change into index image, if make gif animated image 
    [I{i},map]=rgb2ind(im,256); 
    if i == 1 
        imwrite(I{i},map,'F:\Experiment\examle\2_x.gif','gif','LoopCount',Inf,'DelayTime',1.5);
    else 
        imwrite(I{i},map,'F:\Experiment\examle\2_x.gif','gif','WriteMode','append','DelayTime',1.5); 
    end 
   
end