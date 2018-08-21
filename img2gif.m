% put the image transformed into animated gif
nFrames=15;
% Create file name.
% FileName = 'tk_1.gif';
for i = 1:nFrames
    a=strcat('F:\Experiment\ext_data\ext_data_5\L_text\l_',num2str(i),'.bmp');
    I=imread(a);
    imshow(I,[]), axis equal, axis tight; 
    frame=getframe(gcf);  
    im=frame2im(frame);% it's necessary to change into index image, if make gif animated image 
    [I,map]=rgb2ind(im,256); 
    if i == 1 
        imwrite(I,map,'F:\Experiment\ext_data\ext_data_5\l_5.gif','gif','LoopCount',Inf,'DelayTime',1.5);
    else 
        imwrite(I,map,'F:\Experiment\ext_data\ext_data_5\l_5.gif','gif','WriteMode','append','DelayTime',1.5); 
    end 
   
end