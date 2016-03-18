function convertImage2Gray()
cd ('nonfacedata');
for i = 1 : 24
    a = imread(strcat(num2str(i),'.jpg'));
    a = rgb2gray(a);
    imwrite(a,strcat(num2str(i),'.pgm'));
end
cd ..;
end