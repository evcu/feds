function mainFunMulti( rsp )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
MOMENTUM_STRENGTH=1;
global auras auraAlphas par eis;
[auras,auraAlphas]=imProc.getAllAuras(5); %TODO change getAllAuras when you have first five
[ par,eis ] = myNN.loadParameters();
cam = cameraboard(rsp, 'Resolution', '640x480','AWBMode','auto');
detector = cv.CascadeClassifier('haarcascade_frontalface_alt2.xml');
m_preds=[0 0 0 0];
for i=1:100 %Warmup
snapshot(cam);
end

while 1
img = snapshot(cam);
gr = cv.cvtColor(img, 'RGB2GRAY');
f_rect=detector.detect(gr, 'ScaleFactor',  1.3,'MinNeighbors', 2,'MinSize',[30, 30]);
if size(f_rect,2)==0 %modify here to be able to process more img.
    imagesc(img);
    axis image;
    text(400,460,'Happy','BackgroundColor','g')
    text(450,460,'Sad','BackgroundColor','b')
    text(485,460,'Suprized/Fear','BackgroundColor','y')
    text(565,460,'Angry/Disgust','BackgroundColor','r')
%     if counter>10
%             text(320,240,sprintf('LET ME\nSEE\nYOUR FACE'),'Color',[1 0.3 0.2],'FontSize',34,'HorizontalAlignment','center')
%     end
    continue;
end
preds=myNN.guessFacialExpression(gr,f_rect);
img=imProc.mergePNG(img,preds,f_rect);

imagesc(img);
axis image
% f=imagesc(img);
% imProc.showProbablities(f,f_rect,preds);
end


clear cam;
end

