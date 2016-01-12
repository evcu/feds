function folderResize( folder,imtype,dim )
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here
files = dir(strcat(folder,'*.',imtype));
for file = files'
[im , a]=readAndResize(strcat(folder,file.name),dim);
imwrite(im,strcat(folder,file.name),'png','Alpha',a);
end

end

