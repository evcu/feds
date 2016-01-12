function [ preds ] = guessFacialExpression2( im_mono,f_rect )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
global par eis

face=imcrop(im_mono,f_rect);
rimg=double(imresize(face,[30 30]))./255;
[~, ~, pred] = supervised_dnn_cost( par{1}, eis{1}, rimg(:), [], true);
preds(1)=pred(1);
[~, ~, pred] = supervised_dnn_cost(par{2}, eis{2}, rimg(:), [], true);
preds(2)=pred(1);
[~, ~, pred] = supervised_dnn_cost( par{3}, eis{3}, rimg(:), [], true);
preds(3)=pred(1);
[~, ~, pred] = supervised_dnn_cost( par{4}, eis{4}, rimg(:), [], true);
preds(4)=pred(1);

preds=preds./sum(preds);
end

