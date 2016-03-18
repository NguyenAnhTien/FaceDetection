function[distance] = CalculateDistance(eigenface, mean, sub_window, height_face, width_face)

%step 1:
column_vector = reshape(sub_window, height_face * width_face, 1);

%step 2:
omega = double(column_vector) - mean;

%step 3:
mean_omega = 0;

for i = 1 : size(eigenface, 2)
    mean_omega = mean_omega + eigenface(:,i)' * omega * eigenface(:,i);
end

%step 4:
distance = (norm(omega - mean_omega));

end