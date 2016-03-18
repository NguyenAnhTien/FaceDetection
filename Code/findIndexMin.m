function [row, column] = findIndexMin(matrix, compare_value)

    row = 1;
    column = 1;
    
    for i = 1 : size(matrix, 1)
        for j = 1 : size(matrix, 2)
            if(matrix(i, j) ~= 0 && compare_value >= matrix(i, j))
                row = i;
                column = j;
            end
        end
    end
    
end