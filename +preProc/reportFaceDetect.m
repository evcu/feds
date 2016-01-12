clear all;
index=1;
detection_count=zeros(3,4);% 1.st row->1face(succes 2nd row->0face(failure) 3rdrow-->2+face
%Min is checked and it is 23. So 20 is chosen.
for i=1:79
    faces= csvread(sprintf('rawdata/p%02d/faces.txt',i));
    l=size(faces,1)/4;
    for j=1:l
        for k=1:4
            currentpic=j+l*(k-1);
           if faces(currentpic,1)==1 %get the face i there is only one face!!!
               detection_count(1,k)=detection_count(1,k)+1;
           elseif faces(currentpic,1)==0
                detection_count(2,k)=detection_count(2,k)+1;  
           else
                detection_count(3,k)=detection_count(3,k)+1;
           end
            end
    end
end
