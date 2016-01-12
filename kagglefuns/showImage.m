function [ eNum ] = showImage( i ,res)
%UNTÝTLED3 Summary of this function goes here
%   Detailed explanation goes here
 % if exist('emotion','var')&& exist('pixels','var')  
b=reshape(res(i,2:end),48,48);
b=uint8(b);
b=rot90(b,3);
imshow(b);
eNum=res(i,1);
  %end
end

