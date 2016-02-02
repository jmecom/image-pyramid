function [ shift ] = findshift( A, S, R )
%FINDSHIFT Finds the best shift to align S to A within a range R
best = inf;
for dy = -R:R
    for dx = -R:R
        shifted = circshift(S, [dy dx]);      
        score = sum((A(:)-shifted(:)).^2);
        if score <= best
            best = score;
            shift = [dy dx];
        end
    end
end
end

