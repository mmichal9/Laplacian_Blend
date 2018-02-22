function [LS] = combine(LA, LB, GR)
    
    % Input:
    % LA: the Laplacian pyramid of the first image
    % LB: the Laplacian pyramid of the second image
    % GR: Gaussian pyramid of the selected region
    % Output:
    % LS: combined Laplacian pyramid
    
    depth = numel(LA);
    LS = cell(1,depth);
    
    % Combined Laplacian pyramids of the two images.
    % For every level d, and every pixel (i,j) the output for the 
    % combined Laplacian pyramid is of the form:
    % LS(d,i,j) = GR(d,i,j)*LA(d,i,j) + (1-GR(d,i,j))*LB(d,i,j)
    
    for d = 1:depth 
        LS{d} = GR{d}.*LA{d} + (1-GR{d}).*LB{d};
    end
end