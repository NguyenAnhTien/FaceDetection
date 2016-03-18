%%%%% extractiing PCA features of the test image %%%%%

test_image = imread('data\3.pgm');
figure(2);
imshow(test_image);
test_image = test_image(:,:,1);
[r, c] = size(test_image);
temp = reshape(test_image',r*c,1); % creating (MxN)x1 image vector from the 2D image
temp = double(temp)-m; % mean subtracted vector
projtestimg = eigen_face'*temp; % projection of test image onto the facespace

euclide_dist = [];

for i = 1 : size(eigen_face, 2)
    temp = (norm(projtestimg - project_face_image(:,i)))^2;
    euclide_dist = [euclide_dist temp];
end

[euclide_dist_min, recognized_index] = min(euclide_dist);
recognized_img = strcat(int2str(recognized_index),'.pgm');
figure(3);
imshow(strcat('data\', recognized_img));