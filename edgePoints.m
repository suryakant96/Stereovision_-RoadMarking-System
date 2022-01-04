function [LeftBorderPoints,RightBorderPoints] = edgePoints(ImageLeft)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
img1=rgb2gray(ImageLeft);
G1=imgaussfilt(img1,1);
BW1 = imbinarize(G1);
fillL=imfill(BW1,'holes');
edgeL=edge(fillL,'sobel');
edL=uint8(edgeL*255);
[ROW,COL]=size(img1);
LeftBorderPoints=[];
RightBorderPoints = [];
for i=1:ROW
    Lp=find(edL(i,:)==max(edL(i,:)));
    if (length(Lp)>=2)
        LeftBorderPoints=[LeftBorderPoints, Lp(1)];
        RightBorderPoints=[RightBorderPoints, Lp(2)];
    end
end

end

