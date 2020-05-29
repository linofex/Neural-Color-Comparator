function []  = draw(master_rgb, copy_rgb, eu)
if nargin < 3
    disp("usage: draw(master_rgb, copy_rgb)")
    return 
end
if size(master_rgb, 1) ~= size(copy_rgb, 1)
    disp('vectors must have same number of colors!')
    return 
end
if size(eu) ~= size(master_rgb, 1)
    disp('Delta must have same length of rgb!')
    return 
end
if size(master_rgb, 2) ~= 3 || size(copy_rgb, 2) ~= 3
   disp('vectors must be n x 3!')
   return
end

line = 0;
offset = 0;
for i = 1:1:size(master_rgb, 1)
    if i > offset+18
        line = line+1;
        offset = offset +18;   
    end
    rectangle('Position',[2*(i-offset-1),line,1,1],'FaceColor',master_rgb(i,:))
    text('Position',[2*(i-offset-1)+0.3,line+0.5],'string','M')
    text('Position',[2*(i-offset-1),line+0.4],'string', eu(i))
    rectangle('Position',[2*(i-offset)-1,line,1,1],'FaceColor',copy_rgb(i,:))
    text('Position',[2*(i-offset)-1+0.3,line+0.5],'string','C')
    
end

% -1 3 2 3, 2 (1) : 1
% -1 3 2 4, 3 (1) : 1
%  2 0 0 3, 2 (1) : 1
% -1 5 2 2, 3 (1) : 1
% -1 5 2 3, 5 (1) : 1
% -1 6 2 3, 5 (1) : 1
% -1 6 2 2, 3 (1) : 1
%  2 0 0 4, 3 (1) : 1
% -1 0 0 4, 5 (1) : 1
% -1 0 0 3, 3 (1) : 1
% -1 0 0 5, 4 (1) : 1
% -1 0 0 2, 2 (1) : 1
% -1 0 0 1, 1 (1) : 1