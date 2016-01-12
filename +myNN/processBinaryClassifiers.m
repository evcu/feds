function [ preds ] = processBinaryClassifiers(x)
%guessFacialExpression3 guesses ALL detected faces...
[ par,eis ] = myNN.loadParameters();
preds=zeros(4,size(x,2));

[~, ~, pred] = myNN.supervised_dnn_cost( par{1}, eis{1}, x, [], true);
preds(1,:)=pred(1,:);
[~, ~, pred] = myNN.supervised_dnn_cost(par{2}, eis{2}, x, [], true);
preds(2,:)=pred(1,:);
[~, ~, pred] = myNN.supervised_dnn_cost( par{3}, eis{3}, x, [], true);
preds(3,:)=pred(1,:);
[~, ~, pred] = myNN.supervised_dnn_cost( par{4}, eis{4}, x, [], true);
preds(4,:)=pred(1,:);

end


