function [ logoResize,alphaResize ] = readAndResize( name,dim )
%UNTÝTLED3 Summary of this function goes here
%   Detailed explanation goes here

 [im,~,a] = imread(name);
    logoResize = imresize(im, [dim dim], 'bilinear');
alphaResize = imresize(a, [dim dim], 'bilinear');


end

