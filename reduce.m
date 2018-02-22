function g = reduce(I)

    % Input:
    % I: the input image
    % Output:
    % g: the image after Gaussian blurring and subsampling
    
    % Create a Gaussian kernel of size 5x5 and standard deviation = 1.
    ker = fspecial('gaussian',5,1);
    
    % Convolve the input image with the filter kernel
    expout = imfilter(I, ker, 'conv');
    
    % Subsample the image by a factor of 2
    rows = size(I,1);
    cols = size(I,2);

    % Get every other row and column
    img_blur_rows = expout(1:2:rows,:,:);
    g = img_blur_rows(:,1:2:cols,:);
end
