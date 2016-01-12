function []=getFaces(N,savename)

min=30;
index=1;
ed=0; %excluded_data
%Min is checked and it is 23. So 20 is chosen.
for i=N(1):N(2)
    faces= csvread(sprintf('rawdata/p%02d/faces.txt',i));
    l=size(faces,1)/4;
    for j=1:l
        for k=1:4
            currentpic=j+l*(k-1);
           if faces(currentpic,1)==1 %get the face i there is only one face!!!
               data=sprintf('rawdata/p%02d/img%02d-%d.jpg',i,j-1,k);
               temp=imread(data);
               fimg=imcrop(temp,faces(currentpic,2:5));
               if size(fimg,1)<min
                   ed=ed+1
                   continue;
               end
               rimg=imresize(fimg,[min min]);
               gimg=rgb2gray(rimg);
               %if size(fimg,1)<min
               %    min=size(fimg,1);
               %end
               
               x(index,:)=double(gimg(:));
               y(index,1)=k;
               index=index+1;
           else
               fprintf('%d faces at %d pic %dth person\n',faces(currentpic,1), currentpic,i);
           end
        end
    end
end
save(savename,'x','y')

end
