function []=run_train(ClassNo,networkDim,saveDest)

if nargin==2
    isSave=false;
elseif nargin==3
   isSave=true;
else
   error('asds');
end
%% setup environment
% experiment information
% a struct containing network layer sizes etc
ei = [];

% add common directory to your path for
% minfunc and mnist data helpers
addpath ../common;
addpath(genpath('./minFunc'));

%% load mnist data
[data_train, labels_train, data_test, labels_test] = myNN.load_imgs2(ClassNo);

%% populate ei with the network architecture to train
% ei is a structure you can use to store hyperparameters of the network
% the architecture specified below should produce  100% training accuracy
% You should be able to try different network architectures by changing ei
% only (no changes to the objective function code)

% dimension of input features
ei.input_dim = 900;
% number of output classes
ei.output_dim = 2;
% sizes of all hidden layers and the output layer
ei.layer_sizes = [networkDim, ei.output_dim];
% scaling parameter for l2 weight regularization penalty
ei.lambda = 20;
% which type  activation function to use in hidden layers
% feel free to implement support for only the logistic sigmoid function
ei.activation_fun = 'logistic';

%% setup random initial weights
stack = myNN.initialize_weights(ei);
params = myNN.stack2params(stack);

%% setup minfunc options
options = [];
options.display = 'iter';
options.maxFunEval = 380;
options.Method = 'lbfgs';
%grad_check(@supervised_dnn_cost,params,10,ei, data_train, labels_train);
%pause();
%% run training
[opt_params,opt_value,exitflag,output] = minFunc(@supervised_dnn_cost,...
    params,options,ei, data_train, labels_train);

%% compute accuracy on the test and train set
[~, ~, pred] = myNN.supervised_dnn_cost( opt_params, ei, data_test, [], true);
%savePicsWithPropabilities(pred);
[~,pred] = max(pred);
acc_test = mean(pred'==labels_test);
fprintf('test accuracy: %f\n', acc_test);

[~, ~, pred] = myNN.supervised_dnn_cost( opt_params, ei, data_train, [], true);
[~,pred] = max(pred);
acc_train = mean(pred'==labels_train);
fprintf('train accuracy: %f\n', acc_train);

if isSave
   save(saveDest,'opt_params','ei'); 
end
end
