% Read and crop image
im = imread('images/b.tif');
im = autocrop_solid(im, 2, -200);
im = autocrop_fuzzy(im, .02, 120);
dimensions = size(im);
height = int64(dimensions(1)/3);
width = int64(dimensions(2));
 
% Segment the image into thirds
im_b = im(1:height, 1:width);
im_g = im(height:height*2 - 1, 1:width);
im_r = im(height*2:height*3 - 1, 1:width);
 
% Find the best shift to align the images, using an image pyramid
g_shift = pyramid_findshift(double(im_b), double(im_g), 3);
r_shift = pyramid_findshift(double(im_b), double(im_r), 3);

% Perform the aligment
im_g = circshift(im_g, g_shift);
im_r = circshift(im_r, r_shift);

% Convert back to uint8 to display
im_g = uint8(im_g);
im_r = uint8(im_r);

% Combine and display the result
im = cat(3, im_r, im_g, im_b);
% imshow(im);
imwrite(im, 'images/out.jpg')
