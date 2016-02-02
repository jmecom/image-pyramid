function [shift] = pyramid_findshift(A, S, N)
if N == 0
    shift = edges_findshift(A, S, 15); 
else
    A_scaled = blur_and_resize(A, 2);
    S_scaled = blur_and_resize(S, 2);
    
    shift = pyramid_findshift(A_scaled, S_scaled, N-1)*2; 
    S = circshift(S, shift);
    
    shift = shift + edges_findshift(A, S, 2);
end