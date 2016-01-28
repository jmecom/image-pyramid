function [im_aligned, shift] = single_scale_align( A, S, DY, DX )
best = inf;
im_aligned = S;
for dy = -DY:DY
    for dx = -DX:DX
        shifted = circshift(S, [dy dx]);
        score = sum((A(:)-shifted(:)).^2);
        % score = dot( A./norm(A), shifted./norm(shifted) );
        if score <= best
            im_aligned = shifted;
            best = score;
            shift = [dy dx];
        end
    end
end
im_aligned = uint8(im_aligned);
end