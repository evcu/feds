function [ par,eis ] = loadParameters(  )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
load ./+myNN/test1
par{1}=opt_params;
eis{1}=ei;
load ./+myNN/test2
par{2}=opt_params;
eis{2}=ei;
load ./+myNN/test3
par{3}=opt_params;
eis{3}=ei;
load ./+myNN/test4
par{4}=opt_params;
eis{4}=ei;
load ./+myNN/fin
par{5}=opt_params;
eis{5}=ei;

end

