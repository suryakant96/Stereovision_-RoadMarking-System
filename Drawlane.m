function  Drawlane(LeftBorderPoints,RightBorderPoints,frameLeftRect,position)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
lane= ((RightBorderPoints(position)-LeftBorderPoints(position))/2)+LeftBorderPoints(position);
LaneY=[1:length(position)];
LaneX=lane;
imshow(frameLeftRect);
hold on
 plot(LaneX,LaneY, 'y', 'Linewidth', 3)
hold off
end

