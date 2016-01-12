res=zeros(35887,2305);
for i=2:size(pixels,1)
     st=pixels{i};
        a=str2double(regexp(st,'\d*','match'));
        a=uint8(a);
        res(i,:)=[emotion(i,1) a];
  %end
end
