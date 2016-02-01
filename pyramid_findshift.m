function [shift] = pyramid_findshift(A, S, N)
if N == 0
    shift = findshift(A, S, 5); 
else
    A_scaled = imresize(A, 1/2);
    S_scaled = imresize(S, 1/2);
%     A_scaled = blur_and_resize(A, 1/2);
%     S_scaled = blur_and_resize(S, 1/2);
    
    shift = pyramid_findshift(A_scaled, S_scaled, N-1)*2; 
    S = circshift(S, shift);
    
    shift = shift + findshift(A, S, 1);
end