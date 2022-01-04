clc;
clear all;
close all;

load("stereoParams");
imgL=imread('E:\MATLAB\MATLAB2020\bin\Stereo2\ImageL11.png');
imgR=imread('E:\MATLAB\MATLAB2020\bin\Stereo2\ImageR11.png');

%rectify
[frameLeftRect, frameRightRect] = ...
    rectifyStereoImages(imgL, imgR, stereoParams);
figure;
imshow(stereoAnaglyph(frameLeftRect, frameRightRect));
title('Rectified Video Frames1');

%preprocessing of image
[ImageL,ImageR]=preprocessImage(frameLeftRect,frameRightRect);

%disparity
[disparityMap,points3D] = disparity(ImageL,ImageR,stereoParams,frameLeftRect);

%Road Boundary
[LeftBorderPoints,RightBorderPoints] = edgePoints(frameLeftRect);

%Width Of road
[distance,position,everypointdist] = Roadwidth(LeftBorderPoints,RightBorderPoints,disparityMap,points3D);
fprintf("Width of Road is %4.4f cm \n",distance);

%Drawing Lane
Drawlaneimg(LeftBorderPoints,RightBorderPoints,frameLeftRect,position,everypointdist,distance,disparityMap,points3D);




