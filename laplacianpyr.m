function L = laplacianpyr(I,depth)

    % Input:
    % I: the input image
    % depth: number of levels of the Laplacian pyramid
    % Output:
    % L: a cell containing all the levels of the Laplacian pyramid
    
    L = cell(1,depth);
    
    % Create a Gaussian pyramid:
    G = gausspyr(I,depth);

    % Laplacian pyramid, where each level is the corresponding level of
    % the Gaussian pyramid minus the expanded version of the next level of the Gaussian pyramid.
    % The last level of the Laplacian pyramid is the same asthe last level of the Gaussian pyramid
    
    for i = 1:(depth-1)
        tmp = expand(G{i+1});
        rows = size(G{i},1);
        cols = size(G{i},2);
        tmp = tmp(1:rows,1:cols,:);
        L{i} = G{i}-tmp;
    end
    L{end} = G{end};
end
