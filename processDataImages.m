function processDataImages( personNo )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
%MOMENTUM_STRENGTH=3;
global auras auraAlphas par eis;
[auras,auraAlphas]=getAllAuras(4);
[ par,eis ] = loadParameters();
detector = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml');
%m_preds=[0 0 0 0];
for j=1:4
for i=1:50
data=sprintf('rawdata/p%02d/img%02d-%d.jpg',personNo,i-1,j); 
img=imread(data);
gr = cv.cvtColor(img, 'RGB2GRAY');
f_rect=detector.detect(gr, 'ScaleFactor',  1.3,'MinNeighbors', 2,'MinSize',[30, 30]);
if size(f_rect,2)~=1 %modify here to be able to process more img.
    continue;
end
m_preds=guessFacialExpression2(gr,f_rect{1});
%m_preds=(m_preds*(MOMENTUM_STRENGTH-1)+preds)/MOMENTUM_STRENGTH; %Momentum.
img=mergePNG(img,m_preds,f_rect{1});

imagesc(img);
hold on;
a=f_rect{1};
rectangle('Position',a,'Curvature',[0.2 0.2],'EdgeColor','r')
t=text(a(1)+a(3),a(2)+a(4),sprintf('Happy: \t%.02f\nSad: \t%.02f\nSuprized/Fear: \t%.02f\nAngry/Disquist: \t%.02f',m_preds(1),m_preds(2),m_preds(3),m_preds(4)));
set(t,'BackgroundColor',[.7 .9 .7]);
%saveas(gcf,sprintf('./outpics/outpic%d.png',i));

hold off;
clear a;
end
end
end


