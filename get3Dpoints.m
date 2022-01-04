function [centroids3D1,centroids3D2] = get3Dpoints(lefttxt,righttxt,disparityMap,points3D)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
point1=lefttxt;
point2=[righttxt];
X = points3D(:, :, 1);
Y = points3D(:, :, 2);
Z = points3D(:, :, 3);
centroidsIdx1 = sub2ind(size(disparityMap), point1(2), point1(1));
centroids3D1 = [X(centroidsIdx1); Y(centroidsIdx1); Z(centroidsIdx1)];
centroidsIdx2 = sub2ind(size(disparityMap), point2(2), point2(1));
centroids3D2 = [X(centroidsIdx2);Y(centroidsIdx2); Z(centroidsIdx2)];
end

