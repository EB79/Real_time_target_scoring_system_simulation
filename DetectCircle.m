function [center, radius] = DetectCircle(grayimage)

%threshold value
level = graythresh(grayimage);
%applying binary threshold
binary_image = imbinarize(grayimage, level);

%detecting binary regions as rectangular  boundary box and their centroids
stats = regionprops(binary_image, 'BoundingBox', 'centroid');

%testing the stats
%{
figure('Name', 'rectangle')
imshow(grayimage*255)
for i= 1:12
rectangle('Position',[stats(i).BoundingBox(1)
        stats(i).BoundingBox(2)
        stats(i).BoundingBox(3)
        stats(i).BoundingBox(4)],'EdgeColor','r','LineWidth',2 )
end
%}

% mean value for all detected circles 
for i = 1:size(stats)
    center_st(i,1) = stats(i).Centroid(1);
    center_st(i,2) = stats(i).Centroid(2);
end

% center as output for mean center of all circles
center = [mean(center_st(i,1)),mean(center_st(i,1))];

%calculaitng radius based on height and width of boundary rectangles  
for j = 1:size(stats)
    radius(j) = floor(mean((stats(j).BoundingBox(3)/2)+ ...
    (stats(j).BoundingBox(4)/2)))/2;
end

end