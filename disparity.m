function [disparityMap,points3D] = disparity(leftImage,rightImage,stereoParams,frameLeftRect)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%disparityMap = disparitySGM(leftImage,rightImage);
disparityMap =disparitySGM(leftImage,rightImage,'DisparityRange',[0 128],'UniquenessThreshold',10);
% figure;
% imshow(disparityMap, [0, 128]);
% title('Disparity Map');
% colormap(gca,jet)
% colorbar
points3D = reconstructScene(disparityMap, stereoParams);
points3D = points3D ./ 1000;
% ptCloud = pointCloud(points3D, 'Color', frameLeftRect);
% player3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
%     'VerticalAxisDir', 'down');
% view(player3D, ptCloud);

end

