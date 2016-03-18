% A = [1 2 3 4 0 0; 5 6 7 8 0 0; 9 10 11 12 0 0];
% for i = 1 : size(A, 1)
%     for j = 1 : 2 : size(A, 2)
%         if(i + (2 - 1) <= size(A, 1))
%             sub_window = A(i : i + (2 - 1), j : j + (2 - 1));
%             display(sub_window);
%         end
%     end
% end

 B = [1 2 3 4; 5 6 7 8; -1 10 11 12];
% B
% [M, I] = min(A(:));
% [I_row, I_col] = ind2sub(size(A), I);
% I_row
% I_col
% [M, I] = min(A);
% M
% I
 [r, c] = find (B == min((min(B))));
 r
 c

% B = zeros(3,4);
% B(2,3) = 100;
% B
