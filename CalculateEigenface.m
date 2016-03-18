function [A, eigenfaces] = CalculateEigenface(X)

% calculating mean image vector
%m = mean(X,2);

vectorSumColum = calculateSumRowMatrix(X);
m = (1/size(X,2)) * vectorSumColum;

imgcount = size(X,2);

%calculating A matrix, i.e. after subtraction of all image vectors from the mean image vector
A = [];
for i=1 : imgcount
    temp = double(X(:,i)) - m;
    A = [A temp];
end

%A

L= (1 / imgcount) * (A' * A);

%L

[V,D]=eig(L);  %% V : eigenvector matrix  D : eigenvalue matrix

%D1
%D1 = diag(D);
%D1 = sort(D1);
%s = size(D1);
%s = s(1);
%D1 = D1(s-18);

eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i) > 1 )
        eig_vec = [eig_vec V(:,i)];
    end
end

% finally the eigenfaces %%%
eigenfaces = A * eig_vec;

% projectimg =[];
% for i = 1 : size(eigenfaces, 2)
%     temp = eigenfaces' * A(:,i);
%     projectimg = [projectimg temp];
% end
% 
% euclide_dist = [ ];
% for i=1 : size(eigenfaces,2)
%     temp = (norm(projectimg-projectimg(:,i)))^2;
%     euclide_dist = [euclide_dist temp];
% end
% [euclide_dist_min recognized_index] = min(euclide_dist);
% recognized_img = strcat(int2str(recognized_index),'.jpg');
end