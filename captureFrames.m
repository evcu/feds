function captureFrames( rsp,totalFrame,saveName )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
frames=cell(totalFrame,1);
cam = cameraboard(rsp, 'Resolution', '640x480','AWBMode','fluorescent');
for i=1:100 %Warmup
snapshot(cam);
end

for i=1:totalFrame
frames{i,1} = snapshot(cam);
pause(0.04);
imagesc(frames{i,1});
end
save(saveName,'frames');


clear cam;
end

