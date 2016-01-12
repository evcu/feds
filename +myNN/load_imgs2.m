function [data_train, labels_train, data_test, labels_test] = load_imgs2(emNo)
%% TODO ensure this is consistent with common loaders
% assumes relative paths to the common directory
% assumes common directory on paty for access to load functions
% adds 1 to the labels to make them 1-indexed
load('./+myNN/data');
x=x./255; %pixel norm; % TODO check the normalization
%x=pca(x);
n=size(x,1);
yy=(y==emNo);
y(yy)=1;
y(~yy)=2;
data=[x;y];
test_border=11000; %End of 70yh subject
% Split into train and test sets
% The last row of 'data' is the median home price.
data1 = data(:,1:test_border);
m=size(data1,2);
data1 = data1(:, randperm(m));
data_train = data1(1:n,:);
labels_train = data1((n+1):end,:)';

data2 = data(:,(test_border+1):end);
data_test = data2(1:n,:);
labels_test = data2((n+1):end,:)';

