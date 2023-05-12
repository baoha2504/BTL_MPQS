function SetObstacles()
global Obstacles;
global ObstaclesNum;
Obstacles(: ,3) = 0;
Obstacles(1,1) =  60; Obstacles(1,2) = -100; Obstacles(1,4) = 80; % nha
Obstacles(2,1) = -50; Obstacles(2,2) = 20; Obstacles(2,4) = 80;
Obstacles(3,1) = -100; Obstacles(3,2) = 150; Obstacles(3,4) = 60;
Obstacles(4,1) = -50; Obstacles(4,2) = 240; Obstacles(4,4) = 60;
% stone
Obstacles(5,1) = 80; Obstacles(5,2) = 350; Obstacles(5,4) = 70;

Obstacles(6,1) = 190; Obstacles(6,2) = 190; Obstacles(6,4) = 60;
Obstacles(7,1) = 220; Obstacles(7,2) = 50; Obstacles(7,4) = 60;
Obstacles(8,1) = 190; Obstacles(8,2) = -70; Obstacles(8,4) = 70; 
Obstacles(9,1) = 400; Obstacles(9,2) = -400; Obstacles(9,4) = 70; 
Obstacles(10,1) = -380; Obstacles(10,2) = 400; Obstacles(10,4) = 70; 
Obstacles(11,1) = -430; Obstacles(11,2) = 40; Obstacles(11,4) = 70; 
Obstacles(12,1) = -30; Obstacles(12,2) = -40; Obstacles(12,4) = 70; 
%Obstacles(8,1) = 460; Obstacles(8,2) = -510; Obstacles(8,4) = 300;
Obstacles(31,1) = 0;


end