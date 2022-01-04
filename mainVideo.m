clc;
clear all;
close all;

load("stereovideo");
videoFileLeft = 'vid4sepL2.avi';
videoFileRight = 'vid4sepR2.avi';

readerLeft = VideoReader(videoFileLeft);
readerRight = VideoReader(videoFileRight);
%player = vision.VideoPlayer('Position', [200,10,740 560],'Name','Road_Marking');
%output=VideoWriter('results.avi');
%open(output)

while hasFrame(readerLeft) && hasFrame(readerRight)
imgL = readFrame(readerLeft);
imgR = readFrame(readerRight);

%rectify
[frameLeftRect, frameRightRect] = ...
    rectifyStereoImages(imgL, imgR, stereoVideo);
% figure;
% imshow(stereoAnaglyph(frameLeftRect, frameRightRect));
% title('Rectified Video Frames1');

%preprocessing of image
[ImageL,ImageR]=preprocessImage(frameLeftRect,frameRightRect);

%disparity
[disparityMap,points3D] = disparity(ImageL,ImageR,stereoVideo,frameLeftRect);

%Road Boundary
[LeftBorderPoints,RightBorderPoints] = edgePoints(frameLeftRect);

%Width Of road
[distance,position,everypointdist] = Roadwidthvideo(LeftBorderPoints,RightBorderPoints,disparityMap,points3D);

%Drawing Lane
lane= ((RightBorderPoints(position)-LeftBorderPoints(position))/2)+LeftBorderPoints(position);
len=length(position);
LaneY=[1:len];
LaneX=lane;
% text_str= sprintf("Width of Road is %4.4f m and 2 lanes",Roadwidth);
% positiontext=[100 100];
% %positionline=[LaneX(1) LaneY(1) LaneX((end/2)-1) LaneY((end/2)-1);LaneX(end/2) LaneY(end/2) LaneX(end) LaneY(end)];
% positionline=[LaneX(1) LaneY(1) LaneX(end) LaneY(end)];
% img = insertText(frameLeftRect,positiontext,text_str,'FontSize',18);
% img= insertShape(img,'Line',positionline,'LineWidth',2);
% %[img]=drawlanes(RightBorderPoints,LeftBorderPoints,position,Roadwidth);
[img,leftx,yaxis,rightx]=Drawlanevid(LeftBorderPoints,RightBorderPoints,frameLeftRect,position,everypointdist,distance,disparityMap,points3D);

imshow(img)
%step(player, img);
hold on
plot(LaneX(end/4:end),LaneY(end/4:end), 'y', 'Linewidth', 3);
plot(leftx,yaxis,'r','Linewidth',3);
plot(rightx,yaxis,'r','Linewidth',3);

drawnow

%writeVideo(output,img);
end
%close(output);
