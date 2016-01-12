function [ output_args ] = showProbablities( fig,f_rect,mpreds )
%UNTÝTLED3 Summary of this function goes here
%   Detailed explanation goes here
n=size(f_rect,2);
labelPercent=0.2;
for i=1:n
hold on;
a=f_rect{i};
b=mpreds(i,:);
dim=a(3);
levels=zeros(4);
levels(:,2)=a(2)+a(4)+10;
levels(:,4)=ceil(dim*labelPercent);
border=a(1);
for j=1:4
    levels(j,1)=border;
    t=int32(dim*b(j));
    levels(j,3)=t;
    border=border+t;
end

rectangle('Position',a,'Curvature',[0.2 0.2],'EdgeColor','r')

rectangle('Position',levels(1,:),'Curvature',[0.2 0.2],'FaceColor','g','EdgeColor','g')
rectangle('Position',levels(2,:),'Curvature',[0.2 0.2],'FaceColor','b','EdgeColor','b')
rectangle('Position',levels(3,:),'Curvature',[0.2 0.2],'FaceColor','y','EdgeColor','y')
rectangle('Position',levels(4,:),'Curvature',[0.2 0.2],'FaceColor','r','EdgeColor','r')

text(400,460,'Happy','BackgroundColor','g')
    text(450,460,'Sad','BackgroundColor','b')
    text(485,460,'Suprized/Fear','BackgroundColor','y')
    text(565,460,'Angry/Disgust','BackgroundColor','r')
hold off;
clear a;
end

end

