function [distance,position,everypointdist] = Roadwidth(LeftBorderPoints,RightBorderPoints,disparityMap,points3D)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
dist=[];
pos=[];
Range=length(LeftBorderPoints);
X = points3D(:, :, 1);
Y = points3D(:, :, 2);
Z = points3D(:, :, 3);
for j=1:Range
    point1=[j,LeftBorderPoints(j)];
    point2=[j,RightBorderPoints(j)];
    centroidsIdx1 = sub2ind(size(disparityMap), point1(1), point1(2));
    centroids3D1 = [X(centroidsIdx1); Y(centroidsIdx1); Z(centroidsIdx1)];
    centroidsIdx2 = sub2ind(size(disparityMap), point2(1), point2(2));
    centroids3D2 = [X(centroidsIdx2);Y(centroidsIdx2); Z(centroidsIdx2)];
    if isfinite(centroids3D1)
        if isfinite(centroids3D2)
            dis=sqrt(sum((centroids3D1-centroids3D2).^2));
            if dis>0.01
                pos=[pos j];
                dist=[dist dis];
            end
        end
    end
end
%dist=dist+0.003; %it is type of measuring instrument calibration
everypointdist=dist;
distance=(sum(dist)/length(dist))*100;
position=pos;
end

