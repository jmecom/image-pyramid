function [ shift ] = edges_findshift( A, S, R )
%EDGES_FINDSHIFT Finds the best shift to align S to A within a range R
%                Compares the ssd of the edges of two images, instead
%                of just the two images
best = inf;
A_edges = edge(A);
for dy = -R:R
    for dx = -R:R
        shifted = circshift(S, [dy dx]);        
        shifted_edges = edge(shifted);    
        score = sum((A_edges(:)-shifted_edges(:)).^2);   
        if score <= best
            best = score;
            shift = [dy dx];
        end
    end
end
end

