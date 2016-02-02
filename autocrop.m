function [ im ] = autocrop( im, scale, offset)
%AUTOCROP Automatically crops borders around an image
bg = im;
bg(:, :) = im(1,1);
absdiff = double(imabsdiff(im, bg));
absdiff = ((absdiff + absdiff)/scale)+offset;
absdiff = uint8(absdiff);
s = regionprops(absdiff, 'BoundingBox');
im = im(round(s(1).BoundingBox(2):s(1).BoundingBox(2)+s(1).BoundingBox(4)),...
       round(s(1).BoundingBox(1):s(1).BoundingBox(1)+s(1).BoundingBox(3)));
imshow(im);
end

