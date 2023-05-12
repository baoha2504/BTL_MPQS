function behavior_attack()
%% global variables
global TimeSteps;
% global BluesNum; 
% global Blues;
% global Targets;
% global SaveMousePosition;
% global Obstacles;
% global ObstaclesNum;
global EnvironmentWidth;
% global FleeDistance;
% global TimeSteps;
% global BluesNum;
% global Blues;
% global Targets;
% global SaveMousePosition;
% global saveText;
% global saveText;
% global TimeSteps;
global seeDistance;
global Reds RedsNum MaxRedNum RedsHP DieRNum DameOfRed;
global Blues BluesNum MaxBlueNum BluesHP DieBNum DameOfBlue;
global Fights FightsNum MaxFightNum ObstaclesF ;
global Booms BoomsNum Targets TargetsNum;
global SaveMousePosition;
global ImageWidth;
global ObstaclesB ObstaclesNumB;
global ObstaclesR ObstaclesNumR;
global Obstacles ObstaclesNum;
global Goals;
global ShootDistanceB ShootDistanceR;
global kB kR Target1 Target2;
global deviationXB deviationYB deviationXR deviationYR ;
global AccuracyB AccuracyR;
global goToAttack;
goToAttack = 0;
global makeInformation;
makeInformation = zeros(1,RedsNum);
global Counter;
% global FleeDistance;
% Distance behind leader in the Column-formation
D_Behind = 30; 

%% first draw
% load image
[v_ImageR,v_AlphaR,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE]=LoadImageBoids();
[v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6, v_ImageS7,v_AlphaS7, v_ImageS8,v_AlphaS8, v_ImageS9,v_AlphaS9, v_ImageS10,v_AlphaS10, v_ImageS11,v_AlphaS11, v_ImageS12,v_AlphaS12, v_ImageS13,v_AlphaS13, v_ImageS26,v_AlphaS26, v_ImageS27,v_AlphaS27, v_ImageS28,v_AlphaS28, v_ImageS29,v_AlphaS29, v_ImageS30,v_AlphaS30]=LoadImageOther1();
[v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF,v_ImageF,v_AlphaF,v_ImageBR2,v_AlphaBR2]=LoadImageBase();
[v_ImageBoom,v_AlphaBoom,v_ImageN,v_AlphaN,v_ImageEmpty,v_AlphaEmpty]=LoadImageBoom();
[v_ImageFR,v_AlphaFR,v_ImageFB,v_AlphaFB]=LoadImageFlag();

% draw graphic
[fHandler]=InitializeGraphicN();

% draw base

[BasesPlot]=InitializeBase(v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF,v_ImageBR2,v_AlphaBR2);
[BoomsPlot]=InitializeBoom(v_ImageBoom,v_AlphaBoom,v_ImageEmpty,v_AlphaEmpty,Booms,BoomsNum);
[FightsPlot]=InitializeFight(v_ImageF,v_AlphaF);

% draw obstacles
InitializeObstacles(v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6, v_ImageS7,v_AlphaS7, v_ImageS8,v_AlphaS8, v_ImageS9,v_AlphaS9, v_ImageS10,v_AlphaS10, v_ImageS11,v_AlphaS11, v_ImageS12,v_AlphaS12, v_ImageS13,v_AlphaS13, v_ImageS26,v_AlphaS26, v_ImageS27,v_AlphaS27, v_ImageS28,v_AlphaS28, v_ImageS29,v_AlphaS29, v_ImageS30,v_AlphaS30);

[RedsPlot]=InitializeBoid(v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsNum,Reds);
[RedsHP]=InitializeHP(RedsNum,MaxRedNum,Reds);

[BluesPlot]=InitializeBoid(v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesNum,Blues);
[BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

%%load sound
[back, backFS, bomb,gun,fight,bombFs,gunFs,fightFs]=loadSound();
%% Initialize the first positon of Goal
MousePosition = [-200 380 0 0 0 0];
FirstPosition = [350 350 0 0 0 0];
SecondPosition = [400 -500 0 0 0 0];
ThirdPosition = [-200 500 0 0 0 0];
titleStr = 'Tuan tra quanh can cu';
titleStr = [titleStr newline ''];
title(titleStr);

%% calculate agents' positions to move to each iteration
setappdata(0, 'OldTarget', Targets(1, 1:3));

%% INITIALIZE COLUMN-FORMATION FOR FLOCK
Blues(1,1:3) = [10 -400 0];
Blues(1,:) = applyForce(Blues(1,:), 0);
% Reds(1,1:3) = [100 100 0];
% Reds(1,:) = applyForce(Reds(1,:), 0);

Leader = Blues(1, :);
BehindPosition  = Leader;
BoidIndex = 2;
while BoidIndex <= BluesNum
    %Find the RightBeside position of RightBesidePosition (2-nd Boid)
    BehindPosition = FindBehindLeader(BehindPosition,D_Behind);
    Blues(BoidIndex, 1:6) = BehindPosition;
    BehindPosition = Blues(BoidIndex,:);
    Blues(BoidIndex,:) = applyForce(Blues(BoidIndex,:), 0);
       
    BoidIndex = BoidIndex + 1;
end
timeTick = 1;
%% code tuan tra
while (timeTick < 10000)
    if check_reach_obstacles(Leader) == 1
        Goals = MousePosition;
    end
    
     %% Moving the 1-st Boid (as a leader)
    force_arr = steer_arrival(Blues(1,:), MousePosition); %Move toward the mouse
    avd_force= steer_collision_avoidance(Blues(1,:));
    force = force_arr + avd_force*0.05;
    Blues(1,:) = applyForce(Blues(1,:), force);
    
    %% Moving Blues
    Leader = Blues(1, :);            
    [Blues, BoidsIndex] = steer_Arrival_Formation_Column(MousePosition, Blues, Leader, D_Behind);
    %% MousePosition
    if check_reach_Leader(Blues, MousePosition) == 1
        T_tick = 1;
        while (T_tick < 300)
           
            if check_reach_obstacles(Blues(1, :)) == 1
                Goals = FirstPosition;
            end
             %% Moving the 1-st Boid (as a leader)
            force_arr1 = steer_arrival( Blues(1, :), FirstPosition); %Move toward the mouse
            avd_force1= steer_collision_avoidance( Blues(1, :));
            force1 = force_arr1 + avd_force1*0.05;
            Blues(1, :) = applyForce( Blues(1, :), force1);

            %% Moving Blues
            Leader = Blues(1, :);            
            [Blues, BoidsIndex] = steer_Arrival_Formation_Column(FirstPosition, Blues, Leader, D_Behind);
            %% FirstPosition
            if check_reach_Leader(Blues, FirstPosition) == 1
                T_tick1 = 1;
                while (T_tick1 < 300)
                    if check_reach_obstacles(Blues(1, :)) == 1
                        Goals = SecondPosition;
                    end
                     %% Moving the 1-st Boid (as a leader)
                    force_arr2 = steer_arrival( Blues(1, :), SecondPosition); %Move toward the mouse
                    avd_force2= steer_collision_avoidance( Blues(1, :));
                    force2 = force_arr2 + avd_force2*0.05;
                    Blues(1, :) = applyForce( Blues(1, :), force2);

                    %% Moving Blues
                    Leader = Blues(1, :);            
                    [Blues, BoidsIndex] = steer_Arrival_Formation_Column(SecondPosition, Blues, Leader, D_Behind);
                    %% secondPosition
                    if check_reach_Leader(Blues, SecondPosition) == 1
                        T_tick2 = 1;
                        while (T_tick2 < 300)
                            if check_reach_obstacles(Blues(1, :)) == 1
                                Goals = MousePosition;
                            end
                             %% Moving the 1-st Boid (as a leader)
                            force_arr3 = steer_arrival( Blues(1, :), MousePosition); %Move toward the mouse
                            avd_force3= steer_collision_avoidance( Blues(1, :));
                            force3 = force_arr3 + avd_force3*0.05;
                            Blues(1, :) = applyForce( Blues(1, :), force3);

                            %% Moving Blues
                            Leader = Blues(1, :);            
                            [Blues, BoidsIndex] = steer_Arrival_Formation_Column(MousePosition, Blues, Leader, D_Behind);
                            RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
                            T_tick2 = T_tick2+1;
                        end
                    end
                    RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
                    T_tick1 = T_tick1+1;
                end
            end
            RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
            T_tick = T_tick+1;
        end
    end
    
    if see_reds_target() == 1
        break;
    end
   
    RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
    % End of Moving Blues
    M(timeTick)=getframe; %For recording Video
    timeTick = timeTick+1;
end
