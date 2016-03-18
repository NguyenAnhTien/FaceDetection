function [distance_matrix] = DetectFace(mean, eigen_face, image)

height_face = 112;
width_face = 92;

distance_matrix = zeros(size(image, 1), size(image, 2));

for i = 1 : height_face / 8 : size(image, 1)
    for j = 1 : size(image, 2)
        if((i + (height_face - 1) <= size(image, 1)) && (j + (width_face - 1) <= size(image, 2)))
          sub_window = image(i : i + (height_face - 1), j : j + (width_face - 1));
          distance = CalculateDistance(eigen_face, mean, sub_window, height_face, width_face);
          distance_matrix(int32(i), j) = distance;
        end
    end
end

end