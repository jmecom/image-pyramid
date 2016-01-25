clc;

% Read image and grab the dimensions
im = imread('images/00313v.jpg');
dimensions = size(im);
height = int64(dimensions(1)/3);
width = int64(dimensions(2));

% Segment the image into thirds
im_b = im(1:height, 1:width);
im_g = im(height:height*2 - 1, 1:width);
im_r = im(height*2:height*3 - 1, 1:width);

% Align im_g and im_r to the anchor, im_b
im_g = align(double(im_b), double(im_g), 15);
im_r = align(double(im_b), double(im_r), 15);

im = cat(3, im_b, im_g, im_r);
imshow(im);


