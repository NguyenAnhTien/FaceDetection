function showEigenface(eigenface)

number_image = size(eigenface,2);
i = number_image;
j = 1;
while(i >= 1)
    ima=reshape(eigenface(:,i),112,92);
      subplot(ceil(sqrt(number_image)),ceil(sqrt(number_image)),j)
     imshow(ima, []);
     i = i - 1;
     j = j + 1;
end
% for i=number_image:-1:1
%     ima=reshape(eigenface(:,i),112,92);
%       subplot(ceil(sqrt(number_image)),ceil(sqrt(number_image)),i)
%      imshow(ima, []);
% end

end