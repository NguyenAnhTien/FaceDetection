function [vectorSumColum] = calculateSumRowMatrix(matrix)
[row, column] = size(matrix);

vectorSumColum = zeros(row, 1);

for i = 1 : row
    for j = 1 : column
        vectorSumColum(i,1) = vectorSumColum(i,1) + matrix(i,j);
    end
end

end