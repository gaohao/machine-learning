function [xtrain, ytrain, xtest, ytest] = partition()
load Handout.mat;
fold = 10;
partition_size = size(Xtrain, 1) / fold;
partitions = [ones(partition_size, 1); 
              ones(partition_size, 1) + 1; 
              ones(partition_size, 1) + 2; 
              ones(partition_size, 1) + 3;
              ones(partition_size, 1) + 4;
              ones(partition_size, 1) + 5;
              ones(partition_size, 1) + 6;
              ones(partition_size, 1) + 7;
              ones(partition_size, 1) + 8;
              ones(partition_size, 1) + 9];

for i = 1 : fold
    xtrain{i} = Xtrain(partitions ~= i, :);
    ytrain{i} = Ytrain(partitions ~= i, :);
    xtest{i} = Xtrain(partitions == i, :);
    ytest{i} = Ytrain(partitions == i, :);
end


