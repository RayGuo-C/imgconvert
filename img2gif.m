% img2gif
save_file_path = 'F:\Experiment\ext_data\ext_data_1\L\'; % create a path to save the animated
% directly put the image transformed into animated gif
[I,img_num] =  origin_img(file_path) ;
% or set up label for all of the images, then transform them into animated gif
% [I,img_num] = label_img(file_path) ;
for i = 1:img_num
    imshow(I{i}), axis equal, axis tight; 
    frame=getframe(gcf);  
    im=frame2im(frame);% it's necessary to change into index image, if make gif animated image 
    [I{i},map]=rgb2ind(im,256); 
    if i == 1 
        imwrite(I{i},map,strcat(save_file_path,'2_x.gif'),'gif','LoopCount',Inf,'DelayTime',1.5);
    else 
        imwrite(I{i},map,strcat(save_file_path,'2_x.gif'),'gif','WriteMode','append','DelayTime',1.5); 
    end 
end