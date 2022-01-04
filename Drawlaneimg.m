function  Drawlaneimg(LeftBorderPoints,RightBorderPoints,frameLeftRect,position,everypointdist,distance,disparityMap,points3D)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
lane= ((RightBorderPoints(position)-LeftBorderPoints(position))/2)+LeftBorderPoints(position);
LaneY=[1:length(position)];
LaneX=lane;
leftx=LeftBorderPoints(position(end/4:end));
yaxis=position(end/4:end);
dis=100*everypointdist(yaxis(1));
rightx=RightBorderPoints(position(end/4:end));

text_str= sprintf("Width of Road is %4.4f cm and 2 lanes",dis);

positiontext=[220 50];
lefttxt=[leftx(1),yaxis(1)];
righttxt=[rightx(1),yaxis(1)];

[lft,rgt]=get3Dpoints(lefttxt,righttxt,disparityMap,points3D);
txt_lft=sprintf("%4.4f ,%4.4f, %4.4f ",lft(1),lft(2),lft(3));
txt_rgt=sprintf("%4.4f ,%4.4f, %4.4f ",rgt(1),rgt(2),rgt(3));

positionline=[lefttxt,righttxt];

img = insertText(frameLeftRect,positiontext,text_str,'FontSize',12);
img = insertText(img,lefttxt,txt_lft,'FontSize',8);
img = insertText(img,righttxt,txt_rgt,'FontSize',8);
img= insertShape(img,'Line',positionline,'LineWidth',2,'Color','green');
imshow(img);
hold on
 plot(LaneX(end/4:end),LaneY(end/4:end), 'y', 'Linewidth', 3)
 plot(leftx,yaxis,'r-','Linewidth',3)
 plot(rightx,yaxis,'r-','Linewidth',3)
 
hold off
end

