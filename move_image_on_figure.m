% move only one picture on the same figure
I=imread('.jpg');
%create a new axes
h= axes('position',[0.1,0.1,0.5,0.7]);
%put an image on the axes
 imagesc(I);
%turn off the axis ticks and labels
axis off
%plot the image 5 more times with a pause of 0.5 second
for i=2:6
      pause(0.5)
      % update the position of the axis
      set(h,'position',[0.1*i,0.1,0.5,0.7])    
end