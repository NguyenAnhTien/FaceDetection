face_matrix = loadDatabase('data');
[m, mean_face, eigen_face, project_face_image] = createEigenFace(face_matrix);
showEigenface(eigen_face);
% TestEigenFace