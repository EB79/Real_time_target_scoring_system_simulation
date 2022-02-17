 function output = sobel(image)
X =double((image));

% Sobel Gx kernel
Bx = [-1,0,1;
    -2,0,2;
    -1,0,1]; 

% Sobel Gy kernel
By = Bx';

% convolve in 2d
Yx = filter2(Bx,X); 
Yy = filter2(By,X);

% Find magnitude
G = sqrt(Yy.^2 + Yx.^2); 
%Gmin = min(min(G)); 
%dx = max(max(G)) - Gmin; % find range
%G = floor((G-Gmin)/dx*255); % normalise from 0 to 255
output = G ;
end