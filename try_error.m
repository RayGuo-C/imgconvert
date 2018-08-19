h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif'; 
% axis([0, 1, 1, 5]);
% x = linspace(0:0.1:1);
% y = linspace(1:5);
% plot(x,y);
% hold on
A = rgb2gray(imread('E:\Photo-Album\Me\Ray Guo.jpg'));
B = rgb2gray(imread('E:\Photo-Album\Me\Meiye.jpg'));
ImageCell = {A;B}
for   n = 1:numel(ImageCell)
    %z = 0 * x + n;
    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if n == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',1); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',1); 
      end 
  end