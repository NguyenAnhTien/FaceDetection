face_matrix = loadDatabase('data');
[m, mean_face, eigen_face, project_face_image] = createEigenFace(face_matrix);

cd('face_test');

height_face = 112;
width_face = 92;

vector_distance = [];

for i = 1 : 20
    image = imread(strcat(num2str(i), '.jpg'));
    image = rgb2gray(image);
    column_vector = reshape(image, height_face * width_face, 1);
    omega = double(column_vector) - m;
    mean_omega = 0;
    for j = 1 : size(eigen_face, 2)
        mean_omega = mean_omega + eigen_face(:,j)' * omega * eigen_face(:,j);
    end
     distance = (mahal(mean_omega, omega));
     %distance
     vector_distance = [vector_distance distance];
end


%size(vector_distance)
% min_distance = max(vector_distance);
% display(min_distance);
%vector_distance
cd ..

%2.5367e+14
%3.6687e+14