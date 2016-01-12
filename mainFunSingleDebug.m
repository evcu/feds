function mainFunSingleDebug(frName )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
load(frName,'frames');
MOMENTUM_STRENGTH=1;
global auras auraAlphas par eis;
[auras,auraAlphas]=imProc.getAllAuras(5); %TODO change getAllAuras when you have first five
[ par,eis ] = myNN.loadParameters();
detector = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml');
m_preds=[0 0 0 0];

for i=1:size(frames,1)
img = frames{i,1};
pause(0.01);
gr = cv.cvtColor(img, 'RGB2GRAY');
f_rect=detector.detect(gr, 'ScaleFactor',  1.3,'MinNeighbors', 2,'MinSize',[30, 30]);
if size(f_rect,2)~=1 %modify here to be able to process more img.
    imagesc(img);
    continue;
end
preds=myNN.guessFacialExpression2(gr,f_rect);
m_preds=(m_preds*(MOMENTUM_STRENGTH-1)+preds)/MOMENTUM_STRENGTH; %Momentum.
img=imProc.mergePNG(img,m_preds,f_rect);

imagesc(img);
axis image
% f=imagesc(img);
% imProc.showProbablities(f,f_rect,m_preds);
end


clear cam;
end

