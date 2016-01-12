function [ acc ] = testNetworks( )
%testNetworks Returns the performance of the four network.
acc=zeros(5,2);
for i=1:4
%   Detailed explanation goes here
[data_train, labels_train, data_test, labels_test] = myNN.load_imgs2(i);
load (sprintf('./+myNN/test%d',i));
[~, ~, pred] = myNN.supervised_dnn_cost( opt_params, ei, data_test, [], true);
%savePicsWithPropabilities(pred);
[~,pred] = max(pred);
acc(i,2) = mean(pred'==labels_test);

[~, ~, pred] = myNN.supervised_dnn_cost( opt_params, ei, data_train, [], true);
[~,pred] = max(pred);
acc(i,1) = mean(pred'==labels_train);
end
[data_train, labels_train, data_test, labels_test] = myNN.load_imgsTestOnly();
load ('./+myNN/fin');

%% compute accuracy on the test and train set
[~, ~, pred] = myNN.supervised_dnn_cost( opt_params, ei, data_test, [], true);
%savePicsWithPropabilities(pred);
[~,pred] = max(pred);
acc(5,2) = mean(pred'==labels_test);


[~, ~, pred] = myNN.supervised_dnn_cost( opt_params, ei, data_train, [], true);
[~,pred] = max(pred);
acc(5,1) = mean(pred'==labels_train);


end

