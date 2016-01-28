clc;

% Read image and grab the dimensions
im = imread('images/00540u.tif');
dimensions = size(im);
height = int64(dimensions(1)/3);
width = int64(dimensions(2));

% Segment the image into thirds
im_b = im(1:height, 1:width);
im_g = im(height:height*2 - 1, 1:width);
im_r = im(height*2:height*3 - 1, 1:width);

% Align im_g and im_r to the anchor, im_b
% im_g = single_scale_align(double(im_b), double(im_g), 15, 15);
% im_r = single_scale_align(double(im_b), double(im_r), 15, 15);

im_g = multi_scale_align(double(im_b), double(im_g), 15, 15, 4);
im_r = multi_scale_align(double(im_b), double(im_r), 15, 15, 4);

im = cat(3, im_r, im_g, im_b);

imshow(im);
