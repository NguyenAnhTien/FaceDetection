function [data] = prepareImage(columnVector, meanVector)
%multiply columnVector and meanVector
data = meanVector;

    for i = 1 : size(columnVector, 1)
        data = meanVector(i,1) * meanVector;
    end
end