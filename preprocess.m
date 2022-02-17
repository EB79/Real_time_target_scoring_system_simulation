function output_image = preprocess(rgbimage)

% gray image
image = rgb2gray(rgbimage);
%figure('Name','gray')
%imshow(image)

%applying sobel filter
sobel_image = sobel(image);
%figure('Name','sobel_image')
%imshow(sobel_image)

%threshold value
level = graythresh(sobel_image);
%applying binary threshold
binary_image = imbinarize(sobel_image, level);
%figure('Name','binary_image')
%imshow(binary_image)

%applying image closing
Morpholigic_Structure_Element_1 = strel('disk',5,0);
close_image = imclose(binary_image, Morpholigic_Structure_Element_1);
%figure('Name','close_image')
%imshow(close_image)

%applying image erosion
Morpholigic_Structure_Element_2 = strel('rectangle',[10,8]);
erode_image = imerode(close_image, Morpholigic_Structure_Element_2);
%figure('Name','erode_image')
%imshow(erode_image)

%output image as uint8
output_image = erode_image*255;

end