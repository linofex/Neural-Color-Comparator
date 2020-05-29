function [] = colors(index, master_rgb, copy_rgb, target_de, offset)
rectangle('Position',[0,1,1,1],'FaceColor',master_rgb(index,:))
text('Position',[0+0.17,0.98],'string','Master','FontSize', 16)
%text('Position',[0+0.3,1.5],'string',index)

for i = 1:1:11
    rectangle('Position',[i,1,1,1],'FaceColor',copy_rgb(index+offset*i,:))
    text('Position',[i+0.26,0.98],'string', round(target_de(index+offset*i),2), 'FontSize', 16)
end
end