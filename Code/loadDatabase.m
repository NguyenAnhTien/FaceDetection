function [data_out] = loadDatabase(input_dir)

persistent loaded;
persistent w;

cd(input_dir);
if(isempty(loaded))
    v = [];
        for j = 1 : 200
            a = imread(strcat(num2str(j), '.pgm'));
            %a = rgb2gray(a);
            a = reshape(a, 92 * 112, 1);
            v = [v a];
        end
    w = uint8(v); %convert to unsigned 8 bit numbers
end
loaded = 1;
data_out = w;
cd ..
end