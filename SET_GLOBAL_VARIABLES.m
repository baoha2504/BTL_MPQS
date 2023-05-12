function SET_GLOBAL_VARIABLES()
global EnvironmentWidth ImageWidth SafeDistance AlignmentRange CohesionRange...
    wanderAngle FleeDistance SpeedCorrection ...
    BoidsNum Boids TargetsNum  D_BehindLeader ObstaclesNum Obstacles Goals ObstaclesNumB ObstaclesB ObstaclesNumR ObstaclesR ObstaclesF...
     Reds  Blues xi yi DameOfBlue DameOfRed Fights FightsNum  ...
    ShootDistanceB ShootDistanceR MaxRedNum MaxBlueNum BloodPos RedsNum ...
    Target1  Target2 SizeHPBar BaseR BaseB Targets...
    deviationXB deviationYB deviationXR deviationYR ...
    AccuracyB AccuracyR DieRNum DieBNum ...
    Booms BoomsNum seeDistance;


EnvironmentWidth = 600;
ImageWidth = 60;
SafeDistance = EnvironmentWidth/15; % set separation range
AlignmentRange = EnvironmentWidth/5; % set alignment range
CohesionRange = EnvironmentWidth/4; % set cohesion range
wanderAngle = 5;
FleeDistance = 100;
seeDistance = 270;
SpeedCorrection = 100;
%Number of Boids
BoidsNum = 300;
%Number of Targets

TargetsNum = 10;

BloodPos=25;
D_BehindLeader = 60;

%% List of Reds
Reds = zeros(MaxRedNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
Reds(:,1) = EnvironmentWidth/3*(rand([MaxRedNum,1]))-550; % set random position
Reds(:,2) = EnvironmentWidth/3*(rand([MaxRedNum,1]))-480; % set random position
disp(Reds(:,1))
%Reds(:,1:2) = 2; % set random position EnvironmentWidth*(2*rand([RedsNum,2])-1)
Reds(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Reds(:,10) = 4;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Reds(:,11) = 0.2; % set maxforce
Reds(:,13) = 100; % set max see ahead
Reds(:,14) = 10; % set max avoid force
Reds(:,15) = 60; % set blood

%% List of Blues
Blues = zeros(MaxBlueNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
%Blues(:,1:2) = EnvironmentWidth*(2*rand([BluesNum,2])-1); % set random positionB
Blues(:,1) = EnvironmentWidth/3*(rand([MaxBlueNum,1]))+ 500; % set random position
Blues(:,2) = EnvironmentWidth/3*(rand([MaxBlueNum,1]))-500; % set random position
Blues(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Blues(:,10) = 6;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Blues(:,11) = 0.2; % set maxforce
Blues(:,13) = 100; % set max see ahead
Blues(:,14) = 10; % set max avoid force
Blues(:,15) = 100; % set blood
% Blues(1,15) = 10000; % set blood
%% Set static Obstacle data
ObstaclesNum = 12;
Obstacles=zeros(ObstaclesNum,4);
ObstaclesNumB = 1;
ObstaclesB = [0 0 0 0];
ObstaclesNumR = 1;
ObstaclesR = [0 0 0 0];
BaseR=[500 500];
BaseB=[-600 -600];
%% List of Fights
Fights = zeros(2,15);
% BlueOBJ(:,1:2) = EnvironmentWidth/4*(2*rand([BlueNum,2])-1)+300; % set random position
Fights(1,1) = 800; Fights(1,2) = -950; 
Fights(2,1) = 700; Fights(2,2) = -850; 
Fights(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Fights(:,10) = 20;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Fights(:,11) = 0.2; % set maxforce
Fights(:,13) = 200; % set max see ahead
Fights(:,14) = 10; % set max avoid force
Fights(:,15) = 100;

ObstaclesF=zeros(FightsNum,4);

%% Variables
xi = [1,0,0,cos(linspace(pi/2,0,30))]*(FleeDistance-15);
yi = [0,0,1,sin(linspace(pi/2,0,30))]*(FleeDistance-15);

DameOfBlue = 30;
DameOfRed=20;

ShootDistanceB = 200; 
ShootDistanceR = 200; 
Target1 = [-400 -400 0];
Target2 = [100 100 0];
SizeHPBar=1;

%% Accuracy
AccuracyB = rand() * (1 - 0.9) + 0.9;   % do chinh xac
AccuracyR = rand() * (1 - 0.9) + 0.9;   

DieRNum =0 ; 
DieBNum =0;
%% Boom
 BoomsNum= 4;
 Booms = zeros(BoomsNum,4);
 Booms( :,4) = 1;
 Booms(1,1)= -300; Booms(1,2)= -300;
 Booms(2,1)= -350; Booms(2,2)= 200;
 Booms(3,1)= 100; Booms(3,2)= -200;
 Booms(4,1)= 100; Booms(4,2)= -100;
end
