function [data_train, labels_train, data_test, labels_test] = load_imgs()
%% TODO ensure this is consistent with common loaders
% assumes relative paths to the common directory
% assumes common directory on paty for access to load functions
% adds 1 to the labels to make them 1-indexed
load('data_prepared');
testPercent=0.2;
[x,~]=mapminmax(x,0,1);
n=size(x,1);
data=[x;y];
m=size(data,2);
data = data(:, randperm(m));
test_border=floor(m*testPercent);
% Split into train and test sets
% The last row of 'data' is the median home price.
data_test = data(1:n,1:test_border);
labels_test = data((n+1):end,1:test_border)';

data_train = data(1:n,(test_border+1):end);
labels_train = data((n+1):end,(test_border+1):end)';

