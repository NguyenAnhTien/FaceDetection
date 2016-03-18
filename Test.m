%step 1:
display('Read data.....');
face_matrix = loadDatabase('data');
[m, mean_face, eigen_face, project_face_image] = createEigenFace(face_matrix);

display('Read test image.....');
%step 2:
image = imread('Test09.jpg');

image = rgb2gray(image);

%size(image)

%step 3:
display('Calculate distance matrix.....');
distance_matrix = DetectFace(m, eigen_face, image);
%distance = CalculateDistance(eigen_face, m, image, 112, 92);
%distance
%step 4:
[row, column] = findIndexMin(distance_matrix, 4.5286e+14);

%step 5:
Result = insertShape(image, 'Rectangle', [column * 1.0, row * 1.0, 92 * 1.0, 112 * 1.0]);
imshow(image);

%step 6;
imshow(Result);

rectangle('Position',[column row 92 112], 'LineWidth',2, 'EdgeColor','b');