% Load the images for blending:
A = im2double(imread('img/orange.png'));
B = im2double(imread('img/apple.png'));

% Create the mask that defines the blending region:
R = zeros(512,512); R(:,257:512)=1;

% Depth of the pyramids
depth = 5;

% Build the Laplacian pyramids of the two images:
LA = laplacianpyr(A,depth);
LB = laplacianpyr(B,depth);

% Build the Gaussian pyramid of theselected region:
GR = gausspyr(R,depth); 

% Combine the two pyramids using the nodes of GR as weights:
[LS] = combine(LA, LB, GR);

% Colaps the output pyrapid for final blended output:
Ib = collapse(LS);

% Visualize the result
imshow(Ib);