function [LeftBorderPoints,RightBorderPoints] = boundarypoints(ImageLeft)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
img1=rgb2gray(ImageLeft);
G1=imgaussfilt(img1,1);
BW1 = imbinarize(G1);
fillL=imfill(BW1,'holes');
edgeL=edge(fillL,'sobel');
edL=uint8(edgeL*255);
[ROW,COL]=size(img1);
points=[];
for i=1:ROW
    Lp=find(ed1(i,:)==max(ed1(i,:)));
    point= [(i*ones(length(Lp),1)) Lp'];
    points=[points;point];
end
[idx,C] = kmeans(points,2);
LeftBorderPoints  = [points(idx==1,1) points(idx==1,2)];
RightBorderPoints = [points(idx==2,1) points(idx==2,2)];

end

