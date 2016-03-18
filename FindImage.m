I = imread('TestDetect.jpg');
I = rgb2gray(I);
r = 112;
l = 92;

TestBeforeDetect

for i = 1 : size(I, 1) - r
    for j = 1 : size(I, 2) - l
         image = I(i : i + r, j : j + l);
         %[m, A, eigenfaces, project_image] = createEigenFace(image);
         %[r, c] = size(test_image);
         temp = reshape(image', r * l, 1);
         temp = double(temp) - m;
         projtestimg = eigen_face' * temp;
    end
end

