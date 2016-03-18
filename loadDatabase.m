function [data_out] = loadDatabase(input_dir)

persistent loaded;
persistent w;

cd(input_dir);
if(isempty(loaded))
    v = [];
        for j = 1 : 300
            if exist(strcat(num2str(j), '.jpg'), 'file')
                display(strcat('Read image ', strcat(strcat(num2str(j), '.jpg'))));
                a = imread(strcat(num2str(j), '.jpg'));
                if (size(a, 3) > 2)
                    a = rgb2gray(a);
                end
                a = reshape(a, 92 * 112, 1);
                v = [v a];
            end
        end
    w = uint8(v); %convert to unsigned 8 bit numbers
end
loaded = 1;
data_out = w;
cd ..
end