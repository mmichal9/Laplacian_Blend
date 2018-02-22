function G = gausspyr(I,depth)

    % Input:
    % I: the input image
    % depth: number of levels of the Laplacian pyramid
    % Output:
    % G: a cell containing all the levels of the Gaussian pyramid
    
    G = cell(1,depth);
    
    % Gaussian pyramid, where the first level is the original image and 
    % every subsequent level is the reduced version of the previous level.
    
    for i = 1:depth
        if i == 1
            G{i} = I;
            sub = I;
        else
            sub = reduce(sub);
            G{i} = sub;
        end
    end
end
