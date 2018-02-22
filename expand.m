function g = expand(I)

    % Input:
    % I: the input image
    % Output:
    % g: the image after the expand operation

    % Create the expanded image. 
    % The new image should be twice the size of the original image.
    % Every second row and column is filled with the rows and columns of the original image
    %   1st row of I -> 1st row of expanded image
    %   2nd row of I -> 3rd row of expanded image
    %   3rd row of I -> 5th row of expanded image...
    
    rows = size(I, 1);
    cols = size(I, 2);
    expout = zeros([2*rows 2*cols 3]);
    expout(1:2:2*rows,1:2:2*cols,:) = I;
    
    
    % Gaussian kernel of size 5x5 and standard deviation equal to 1.
    ker = fspecial('gaussian',5,1);
    
    % Convolve the input image with the filter kernel
    % Multiply the output of the filtering with a factor of 4
    expout = imfilter(expout, ker, 'conv');
    expout = 4*expout;
    g = expout;
end
