%step 1: 
face_matrix = loadDatabase('data');
[m, mean_face, eigen_face, project_face_image] = createEigenFace(face_matrix);

%step 2:
eigen_face_column = eigen_face(:,1);

%step 3:
height_face = 112;
width_face = 92;

%step 4:
cd('face_test');

%step 5:
vector_distance = [];

%step 6:
for i = 1 : 20
    image = imread(strcat(num2str(i), '.jpg'));
    image = rgb2gray(image);
    column_vector = reshape(image, height_face * width_face, 1);
    omega = double(column_vector) - m;
    mean_omega = 0;
    for j = 1 : size(eigen_face_column, 2)
        mean_omega = mean_omega + eigen_face_column(:,j)' * omega * eigen_face_column(:,j);
    end
     distance = (norm(omega - mean_omega));
     %distance
     vector_distance = [vector_distance distance];
end

substract_vector_distance = [];

for i = 1 : size(vector_distance, 2)
    for j = 1 : size(vector_distance, 2)
        if i ~= j
          distance = vector_distance(i) - vector_distance(j);
          substract_vector_distance  = [substract_vector_distance distance];
        end
    end
end

for i = 1 : size(substract_vector_distance, 2)
    substract_vector_distance(i) = abs(substract_vector_distance(i));
end

compare_value = min(substract_vector_distance);

cd ..

image = imread('Test08.jpg');

distance_matrix = zeros(size(image, 1), size(image, 2));

for i = 1 : height_face / 8 : size(image, 1)
    for j = 1 : size(image, 2)
        if((i + (height_face - 1) <= size(image, 1)) && (j + (width_face - 1) <= size(image, 2)))
          sub_window = image(i : i + (height_face - 1), j : j + (width_face - 1));
          column_vector = reshape(sub_window, height_face * width_face, 1);
          omega = double(column_vector) - m;
          mean_omega = 0;
          for k = 1 : size(eigen_face, 2)
               mean_omega = mean_omega + eigen_face(:,k)' * omega * eigen_face(:,k);
          end
          distance = (norm(omega - mean_omega));
          distance_matrix(int32(i), j) = distance;
        end
    end
end

[row, column] = findIndexMin(distance_matrix, compare_value);

imshow(image);
rectangle('Position',[column row 92 112], 'LineWidth',2, 'EdgeColor','b');