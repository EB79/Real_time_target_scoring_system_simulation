function out = score(frame, baseframe, center, radius)

%applying sobel filter for video frame
frame_sobel = sobel(frame);
%applying sobel filter for base frame(first frame)
baseframe_sobel = sobel(baseframe);

%applying image erosion for clearing noisy pixcels 
Morpholigic_Structure_Element_1 = strel('rectangle',[5,5]);
erode_image1 = imerode(frame_sobel-baseframe_sobel, Morpholigic_Structure_Element_1);

%applying adaptive image binary threshold
hit_point_binary = imbinarize(erode_image1, 'adaptive');

%applying image closing for filling gaps between circles
Morpholigic_Structure_Element_2 = strel('disk',30,0);
close_image = imclose(hit_point_binary, Morpholigic_Structure_Element_2);

% statistics for center of detected hit points
st = regionprops(close_image,'centroid');

%initial values
hit_point_radius = 3500;
value = NaN;
% if statement for checking whether st is created or not
if isstruct(st) == 1
    %calculating Euclidean distance between center and center of hit points
    for i = 1:size(st)
        hit_point_radius(i) = sqrt((st(i).Centroid(1)-center(1))^2 + (st(i).Centroid(2)-center(2))^2);
    end
    
    number_of_points = size(hit_point_radius);
    %calculating hit points earned
    for j = 1:number_of_points(2)
        value(j) = point_calc(hit_point_radius(j), radius(1:11));
    end
    %output as hit points value
    out = value;
else
    % if st in not created then value =0
    out = NaN ;
end

end