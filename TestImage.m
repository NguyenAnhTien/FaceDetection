I = imread('testimage.pgm');
I = I(:,:,1);
[r, c] = size(I);
temp = reshape(I, r * c, 1);
temp = double(temp)-mean_face;
projtestimg = eigen_face' * temp;

euclide_dist = [ ];
for i = 1 : size(eigen_face,2)
    temp = (norm(projtestimg - project_face_image(:,i)))^2;
    euclide_dist = [euclide_dist temp];
end

[euclide_dist_min, recognized_index] = min(euclide_dist);
euclide_dist_min
recognized_index