function [im ,alphaResize] = getMergedAura(faceDim,preds )
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here
global auras auraAlphas;
randomI=ceil(rand()*4);
im=repmat(uint8(0),faceDim,faceDim,3);
alph=repmat(uint8(0),faceDim,faceDim);
for i=1:4
auResize = imresize(auras{i,randomI}, [faceDim faceDim], 'bilinear');
alphaResize = imresize(auraAlphas{i,randomI}, [faceDim faceDim], 'bilinear');
im=im+auResize.*preds(i);
alph=alph+alphaResize.*preds(i);
end
    alphaResize = repmat(alph, [1 1 3]);
    alphaResize = im2double(alphaResize);
end

