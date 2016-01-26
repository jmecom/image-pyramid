function im_aligned = single_scale_align( A, S, D )
best = inf;
im_aligned = S;
for dy = -D:D
    for dx = -D:D
        shifted = circshift(S, [dy dx]);
        score = sum((A(:)-shifted(:)).^2);
        % score = dot( A./norm(A), shifted./norm(shifted) );
        if score <= best
            im_aligned = shifted;
            best = score;
        end
    end
end
im_aligned = uint8(im_aligned);
end