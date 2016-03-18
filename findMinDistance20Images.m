function [min_distance] = findMinDistance20Images(m, eigen_face)

cd ('face_test');
height_face = 112;
width_face = 92;
vector_distance = [];

for i = 1 : 20
    image = imread(strcat(num2str(i), '.jpg'));
    image = rgb2gray(image);
    distance = CalculateDistance(eigen_face, m, image, height_face, width_face);
    vector_distance = [vector_distance distance];
end

min_distance = min(vector_distance);

cd ..

end