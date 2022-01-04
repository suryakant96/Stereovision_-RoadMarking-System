function [Imageleft,Imageright] = preprocessImage(ImageLeft,ImageRight)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
img1=rgb2gray(ImageLeft);
img2=rgb2gray(ImageRight);
G1=imgaussfilt(img1,1);
G2=imgaussfilt(img2,1);
BW1 = imbinarize(G1);
BW2 = imbinarize(G2);
Imageleft = uint8(BW1);
Imageright = uint8(BW2);
end

