%%================================================================
%% Step 0a: Load data
%  Here we provide the code to load natural image data into x.
%  x will be a 784 * 600000 matrix, where the kth column x(:, k) corresponds to
%  the raw image data from the kth 12x12 image patch sampled.
%  You do not need to change the code below.


[x,y,~,~] = myNN.load_imgs2(1);
x=x(:,y==1);
a=figure('name','Happy Faces');
randsel = randi(size(x,2),200,1); % A random selection of samples for visualization
myNN.display_network(x(:,randsel));
saveas(a,'Happy.jpg');


[x,y,~,~] = myNN.load_imgs2(2);
x=x(:,y==1);
a=figure('name','Sad Faces');
randsel = randi(size(x,2),200,1); % A random selection of samples for visualization
myNN.display_network(x(:,randsel));
saveas(a,'Sad.jpg');

[x,y,~,~] = myNN.load_imgs2(3);
x=x(:,y==1);
a=figure('name','Suprized Faces');
randsel = randi(size(x,2),200,1); % A random selection of samples for visualization
myNN.display_network(x(:,randsel));
saveas(a,'Suprized.jpg');

[x,y,~,~] = myNN.load_imgs2(4);
x=x(:,y==1);
a=figure('name','Angry Faces');
randsel = randi(size(x,2),200,1); % A random selection of samples for visualization
myNN.display_network(x(:,randsel));
saveas(a,'Angry.jpg');

