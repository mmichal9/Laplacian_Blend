function I = collapse(L)

    % Input:
    % L: the Laplacian pyramid of an image
    % Output:
    % I: recovered image from the Laplacian pyramid
    
    depth = numel(L);
    
    % Recover the image that is encoded in the Laplacian pyramid
    
    for i = depth-1:-1:1
        L{i} = L{i} + expand(L{i+1});
    end
    I = L{1};

end
