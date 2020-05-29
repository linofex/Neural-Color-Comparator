line = 0;
offset = 0;
ind = [];
line_index = 1;
for i = 1:1:size(master_rgb, 1)
    if line_index> offset+20
        line = line+1;
        offset = offset +20;   
    end
    rectangle('Position',[2*(line_index-offset-1),line,2,1],'FaceColor',master_rgb(i,:))
    text('Position',[2*(i-offset-1)+0.3,line+0.5],'string', line_index)
    ind = [ind, i];
    line_index = line_index +1;
    
end
