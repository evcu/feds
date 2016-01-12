function [ preds ] = guessFacialExpression( im_mono,f_rect )
%guessFacialExpression3 guesses ALL detected faces...
global par eis
n=size(f_rect,2);
preds=zeros(n,4);
for i=1:n
face=imcrop(im_mono,f_rect{i});
rimg=double(imresize(face,[30 30]))./255;
[~, ~, pred] = myNN.supervised_dnn_cost( par{1}, eis{1}, rimg(:), [], true);
preds(i,1)=pred(1);
[~, ~, pred] = myNN.supervised_dnn_cost(par{2}, eis{2}, rimg(:), [], true);
preds(i,2)=pred(1);
[~, ~, pred] = myNN.supervised_dnn_cost( par{3}, eis{3}, rimg(:), [], true);
preds(i,3)=pred(1);
[~, ~, pred] = myNN.supervised_dnn_cost( par{4}, eis{4}, rimg(:), [], true);
preds(i,4)=pred(1);

preds(i,:)=preds(i,:)./sum(preds(i,:)); %Normalized
end
end

