function [ p ] = pyramid( im, N )
%PYRAMID Returns a cell array containing the images of a Guassian image
%        pyramid of size N
p = {im};
for i = 2:N
    gaussian_filter = fspecial('gaussian', [5 5], i);
    im_scaled = imfilter(im, gaussian_filter, 'same');
    im_scaled = imresize(im_scaled, 1/i);
    p{end+1} = im_scaled;
end
end

