function [ im_scaled ] = blur_and_resize( im, factor )
%BLUR_AND_RESIZE Gaussian blurs and resizes an image by a factor
gaussian_filter = fspecial('gaussian', [5 5], factor);
im_scaled = imfilter(im, gaussian_filter, 'same');
im_scaled = imresize(im_scaled, 1/factor);
end

