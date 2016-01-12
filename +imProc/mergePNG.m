function [ img ] = mergePNG( img,preds,faces )
%mergePNG 
%requires preds is normalized to a probability dist.
n=size(faces,2);
for i=1:n
face=faces{i}; 
faceDim=face(3);

[im ,alphaResize]=imProc.getMergedAura(faceDim,preds(i,:));
    x=face(1);
    y=ceil(face(2)-faceDim*1.5);
    x2=x+faceDim-1;
    y2=y+faceDim-1;
    if y<=0
       ext=-y+2;
       aura=alphaResize(ext:end,:,:).*double(im(ext:end,:,:));
       img(1:y2,x:x2,:) = uint8( aura+(1-alphaResize(ext:end,:,:)).*double(img(1:y2,x:x2,:)));
    else
        img(y:y2,x:x2,:) = uint8(alphaResize.*double(im) + ...
        (1-alphaResize).*double(img(y:y2,x:x2,:))); 
    end

    %// Mix in the logo with the image
   
end

end

