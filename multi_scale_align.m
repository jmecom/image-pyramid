function [ im_aligned ] = multi_scale_align( A, S, DY, DX, N )
%MULTI_SCALE_ALIGN Uses a Gaussian image pyramid to align an image S to an
%                  anchor A within a displacement range D

%Generate the image pyramid for A and S
pA = pyramid(A, N);
pS = pyramid(S, N);

%Align the image
s = [1 1];
for i = N:-1:1
    DY = s(1) * i;   %multiplicative or additive?
    DX = s(2) * i; 
    N
    [DY DX]
    [im_aligned, s] = single_scale_align(pA{i}, pS{i}, DY, DX);
end

im_aligned = uint8(im_aligned);

end

