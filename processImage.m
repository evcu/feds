function [] = processImage(name )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
global auras auraAlphas par eis;
[auras,auraAlphas]=getAllAuras(5);
[ par,eis ] = loadParameters();
detector = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml');
img=imread(name);
gr = cv.cvtColor(img, 'RGB2GRAY');
f_rect=detector.detect(gr, 'ScaleFactor',  1.3,'MinNeighbors', 2,'MinSize',[30, 30]);
if size(f_rect,2)==0 %modify here to be able to process more img.
    display No face detected
    return;
end
m_preds=guessFacialExpression3(gr,f_rect);
%m_preds=(m_preds*(MOMENTUM_STRENGTH-1)+preds)/MOMENTUM_STRENGTH; %Momentum.
img=mergePNG(img,m_preds,f_rect);

imagesc(img);
end

