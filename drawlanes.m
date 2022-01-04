function [img] = drawlanes(RightBorderPoints,LeftBorderPoints,position,Roadwidth,frameLeftRect)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
lane= ((RightBorderPoints(position)-LeftBorderPoints(position))/2)+LeftBorderPoints(position);
len=length(position);
LaneY=[1:len];
if 7 <= Roadwidth <=10.5
    LaneX=lane;
    LaneX1=[];
    LaneX2=[];
    LaneY1=[];
    LaneY2=[];
    for i=1:len
        a=mod(i,2);
        if a==0
            LaneX2=[LaneX2; LaneX(i)];
            LaneY2=[LaneY2; LaneY(i)];
        else
            LaneX1=[LaneX1; LaneX(i)];
            LaneY1=[LaneY1; LaneY(i)];
        end

    end
    l=length(LaneX2);
    LaneX1=LaneX1(1:l);
    LaneY1=LaneY1(1:l);        
    text_str= sprintf("Width of Road is %4.4f m and two lanes",Roadwidth);
    positiontext=[100 100];
    positionline=[LaneX1 LaneY1 LaneX2 LaneY2];
    %img = insertText(frameLeftRect,positiontext,text_str,'FontSize',18);
    img= insertShape(frameLeftRect,'Line',positionline,'LineWidth',2);
end

end

