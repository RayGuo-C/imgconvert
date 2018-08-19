% dynamic display the different or same function at the different moment. 
% show the animated gif for function on the same figure
h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';
axis([0, 1, 1, 5]);
hold on
for n = 1:0.5:5
    % Draw plot for y = n
    x = 0:0.01:1;
    y = 0 * x + n;
    plot(x,y) 
    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if n == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',1); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
      pause(0.02)
  end