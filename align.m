function im_aligned = align(A, S, D)
best = inf;    
im_aligned = S;

for dy = -D:D
    for dx = -D:D
        shifted = circshift(S, [dy dx]);
        score = sum((A(:)-S(:)).^2);
        % score = dot(A(:),S(:))/norm(A(:))/norm(S(:));
        if score <= best
            im_aligned = shifted;
            best = score;
        end
    end
end

im_aligned = uint8(im_aligned);

end

% sum((im_b(:)-im_g(:)).^2)
% dot(im_b(:),im_g(:))/norm(im_b(:))/norm(im_g(:));