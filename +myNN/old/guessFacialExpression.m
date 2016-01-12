function [ preds ] = guessFacialExpression( im_mono,f_rect )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
load param1
t1=opt_params;
ei1=ei;
load param2
t2=opt_params;
ei2=ei;
load param3
t3=opt_params;
ei3=ei;
load param4
t4=opt_params;
ei4=ei;

face=imcrop(im_mono,f_rect);
rimg=double(imresize(face,[30 30]))./255;
[~, ~, pred] = supervised_dnn_cost( t1, ei1, rimg(:), [], true);
preds(1)=pred(1);
[~, ~, pred] = supervised_dnn_cost( t2, ei2, rimg(:), [], true);
preds(2)=pred(1);
[~, ~, pred] = supervised_dnn_cost( t3, ei3, rimg(:), [], true);
preds(3)=pred(1);
[~, ~, pred] = supervised_dnn_cost( t4, ei4, rimg(:), [], true);
preds(4)=pred(1);

preds=preds./sum(preds);
end

