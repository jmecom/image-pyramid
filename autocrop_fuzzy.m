function [ im ] = autocrop_fuzzy( im, threshold, range )
%AUTOCROP_FUZZY Automatically crops fuzzy borders
[h, w] = size(im);
im_f = im;
im_f = im2bw(im_f, .4);
im_e = imcomplement(im_f);

% Crop left
cut = w;
for i = 1:range
    white_density = sum(im_e(:, i))/h;
    if white_density >= threshold
        cut = i;
    end
end

im = im(:, cut:w);

% Crop right
[h, w] = size(im);
cut = w;
for i = w:-1:(w-range)
    white_density = sum(im_e(:, i))/h;
    if white_density >= threshold
        cut = i;
    end
end

im = im(:, 1:cut);

% Divide image into threes to crop top and bottom
h = int64(size(im,1)/3);
w = int64(size(im,2));
im_top = im(1:h, 1:w);
im_mid = im(h:h*2 - 1, 1:w);
im_bot = im(h*2:h*3 - 1, 1:w);

% Crop top from all 3
[h, w] = size(im_top);
cut = h;
for i = 1:range
    white_density = sum(im_top(i, :))/w;
    if white_density >= threshold
        cut = i;
    end
end

im_top = im_top(cut:h, :);
im_mid = im_mid(cut:h, :);
im_bot = im_bot(cut:h, :);

% Crop bot from all 3
[h, w] = size(im_bot);
cut = h;
for i = h:-1:(h-range)
    white_density = sum(im_bot(i, :))/w;
    if white_density >= threshold
        cut = i;
    end
end

im_top = im_top(1:cut, :);
im_mid = im_mid(1:cut, :);
im_bot = im_bot(1:cut, :);

im = cat(1, im_top, im_mid, im_bot);

end

