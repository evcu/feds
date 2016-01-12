function mainFunMultiDebug( name )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
MOMENTUM_STRENGTH=3;
load(name,'frames');
global auras auraAlphas par eis;
[auras,auraAlphas]=imProc.getAllAuras(5); %TODO change getAllAuras when you have first five
[ par,eis ] = myNN.loadParameters();
detector = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml');
m_preds=[0 0 0 0];

for i=1:size(frames,1)
img = frames{i,1};
gr = cv.cvtColor(img, 'RGB2GRAY');
f_rect=detector.detect(gr, 'ScaleFactor',  1.3,'MinNeighbors', 2,'MinSize',[30, 30]);
if size(f_rect,2)==0 %modify here to be able to process more img.
    continue;
end
preds=myNN.guessFacialExpression(gr,f_rect);
img=imProc.mergePNG(img,preds,f_rect);
imagesc(img);
pause(0.005);
hold on;
%a=f_rect{1};
%rectangle('Position',a,'Curvature',[0.2 0.2],'EdgeColor','r')
%t=text(a(1)+a(3),a(2)+a(4),sprintf('Happy: \t%.02f\nSad: \t%.02f\nSuprized/Fear: \t%.02f\nAngry/Disquist: \t%.02f',m_preds(1),m_preds(2),m_preds(3),m_preds(4)));
%set(t,'BackgroundColor',[.7 .9 .7]);
%saveas(gcf,sprintf('./outpics/outpic%d.png',i));

hold off;
clear a;
end


clear cam;
end

