function []=putAuras(N)

min=30;
index=1;
detector = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml');

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
               img=imread(data);
               gr = cv.cvtColor(img, 'RGB2GRAY');
                f_rect=detector.detect(gr, 'ScaleFactor',  1.3,'MinNeighbors', 2,'MinSize',[30, 30]);
                preds=guessFacialExpression(gr,f_rect{1});
                finalIMG=mergePNG(img,preds,f_rect{1});
                imwrite(finalIMG,sprintf('auradata/p%02d/img%02d-%d.jpg',i,j-1,k));
           else
               fprintf('%d faces at %d pic %dth person\n',faces(currentpic,1), currentpic,i);
           end
        end
    end
end

end
