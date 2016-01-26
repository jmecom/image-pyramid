function [ im_scaled ] = blur_and_resize( im )
%BLUR_AND_RESIZE Gaussian blurs and resizes an image by a factor of 1/2 
im_scaled = imresize(im, .5);
gaussian_filter = fspecial('gaussian', [5 5], 2);
im_scaled = imfilter(im_scaled, gaussian_filter, 'same');
end

