function [ auras,aurasAlpha ] = getAllAuras(auraPerExp  )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
locs={'./aura/aura_happy_';'./aura/aura_sad_';'./aura/aura_surprised_';'./aura/aura_angry_'};
auras=cell(4,auraPerExp);
aurasAlpha=cell(4,auraPerExp);
for i=1:4
    for j=1:auraPerExp
        [auras{i,j},~,aurasAlpha{i,j}] = imread(strcat(locs{i},int2str(j+5),'.png'));
    end
end

end

