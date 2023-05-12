function Behavior__CollisionAvoidance_Formation_Column()
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
D_Behind = 50; 

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

sound(back, backFS);

%Initialize the first positon of Goal
MousePosition = [560 -180 0 0 0 0];
% SaveMousePosition = plot(MousePosition(1), MousePosition(2), 'o','MarkerSize',2,'MarkerFaceColor','yellow','Color','yellow');
% saveText = text(MousePosition(1) + 30, MousePosition(2)+ 10, 'Goal');
titleStr = 'Hanh quan den diem tap ket';
titleStr = [titleStr newline ''];
title(titleStr);
% set(fHandler, 'WindowButtonDownFcn',@cursorClickCallback);

%Event Mouse click
%     function cursorPosition = cursorClickCallback(o,e)
%         p = get(gca,'CurrentPoint');
%         cursorPosition(1:2) = p(1,1:2);
%         cursorPosition(3:6) = 0;
%         MousePosition = cursorPosition;
%         %Delete the old Target and Redraw a new Target
%         delete(SaveMousePosition);
%         %Draw Circle - Targer
%         SaveMousePosition = plot(MousePosition(1), MousePosition(2), 'o','MarkerSize',15,'MarkerFaceColor','yellow','Color','yellow');
%         delete(saveText);
%         saveText = text(MousePosition(1) + 30, MousePosition(2)+ 10, 'Goal');
%         kB=1;
%         kR=1;
%     end
%% calculate agents' positions to move to each iteration
setappdata(0, 'OldTarget', Targets(1, 1:3));

%% INITIALIZE COLUMN-FORMATION FOR FLOCK
Blues(1,1:3) = [-300 -500 0];
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
% RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
% [BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

% RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
% [RedsHP]=InitializeHP(RedsNum,MaxRedNum,Reds);

%% FLOCK MOVE TO THE GOAL
% Generate random colors for drawing the footprints of boids
timeTick = 1;
obstacles_avd = 0;
while (timeTick < TimeSteps)
    %% Wander Reds
    for RedIndex = 1:RedsNum
        % steering
        Reds = updateAtBoundary(Reds,RedIndex);
        
        CurrentBoid = Reds(RedIndex, :);
        force = steer_wander(CurrentBoid);
        Reds(RedIndex,:) = applyForce(CurrentBoid, force);                
    end
    % redraw
    RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    %% Moving the 1-st Boid (as a leader)
    if check_reach_obstacles(Blues(1,:)) == 1
        Goals = MousePosition;
    end
    
    force = 0.8*steer_arrival(Blues(1,:), Goals(1,:)); 
    force = force + 1*steer_collision_avoidance(Blues(1,:));    
    Blues(1,:) = applyForce(Blues(1,:), force);
    Leader = Blues(1, :);            
    [Blues, BoidsIndex] = steer_Arrival_Formation_Column(Goals, Blues, Leader, D_Behind);
    
    for blueidx=1:BluesNum
        if check_colistion(Blues, MousePosition) == 1
            Blues(blueidx,:) = applyForce(Blues(blueidx,:), 0);
        end
    end
    
    if check_colistion(Blues, MousePosition) == 1
        SetGoals();
    end
    
    if see_reds_target() == 1
        break;
    end
    
    RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
    RedrawRedsHP();
    RedrawBlueHP();
    % End of Moving Blues
    M(timeTick)=getframe; %For recording Video
    timeTick = timeTick+1;
end

%% Co c?m
timeTick = 1;
ik = 1;
red_alive = RedsNum;
Leader = Blues(ik, :);
while (timeTick < TimeSteps)        
    
    if see_reds_target() == 1
        for BlueIndex = 1:BluesNum
            Blues = updateAtBoundary(Blues,BlueIndex);
            CurrentBlue = Blues(BlueIndex, :);
            if BlueIndex == ik
                arr_force = 3.0*steer_arrival(CurrentBlue, Leader);
                Blues(BlueIndex,:) = applyForce(CurrentBlue, arr_force);
            else
                arr_force = 3.0*steer_arrival(CurrentBlue, Leader);
                avd_force = 1.0*steer_collision_avoidance(Blues(BlueIndex,:)); 
                coh_force = 0.8*steer_cohesion(CurrentBlue);           
                force = arr_force + avd_force + coh_force + 0.2*steer_separation(CurrentBlue);           
                Blues(BlueIndex,:) = applyForce(CurrentBlue, force);
            end
                  
        end
    else
        force = 3.0*steer_arrival(Leader, Goals(1,:)); 
        force = force + 1*steer_collision_avoidance(Leader);    
        Blues(ik,:) = applyForce(Leader, force);
        Leader = Blues(ik, :);            
        [Blues, BoidsIndex] = steer_Arrival_Formation_Column2(Goals, Blues, Leader, D_Behind);
    end
    
    for redidx=1:RedsNum
        if Reds(redidx,15) <= 0
            red_alive = red_alive - 1;
        end
    end
    
    if Leader(15) <= 0
        ik = ik + 1;
        Leader = Blues(ik, :);
    end
   
    for i = 1: RedsNum
        if ( Reds(i,15)<= 0 ) 
            DieRNum = DieRNum +1;
        end
    end   
    if ( DieRNum == RedsNum) 
        force = 3.0*steer_arrival(Leader, Goals(1,:)); 
        force = force + 1*steer_collision_avoidance(Leader);    
        Blues(ik,:) = applyForce(Leader, force);
        Leader = Blues(ik, :);            
        [Blues, BoidsIndex] = steer_Arrival_Formation_Column2(Goals, Blues, Leader, D_Behind);
     else
       DieRNum =0;
     end
    if check_reach_goals(Blues, Goals)
        break;
    end
    
   
    
    %% Wander Reds
    for RedIndex = 1:RedsNum
        % steering
        Reds = updateAtBoundary(Reds,RedIndex);
        
        CurrentBoid = Reds(RedIndex, :);
        force = steer_wander(CurrentBoid);
        Reds(RedIndex,:) = applyForce(CurrentBoid, force);                
    end
    % redraw
    RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);

    %% Attack
    %% daviation Blue
    deviationXB = ShootDistanceB*(1-AccuracyB*(2*rand - 1));
    deviationYB = ShootDistanceB*(1-AccuracyB*(2*rand - 1));
    
    %% daviation Red
    deviationXR = ShootDistanceR*(1-AccuracyR*(2*rand - 1));
    deviationYR = ShootDistanceR*(1-AccuracyR*(2*rand - 1));
    %% Reds
    AttackBlue=zeros(1,BluesNum);  
    for i=1:RedsNum
        if(Reds(i,15)>0)
            Reds = updateAtBoundary(Reds,i);
            CurrentBoid = Reds(i,:);
            [J,tmpDist]=findTarget(Reds(i,:),BluesNum,Blues);  
            if (J>0 && dist(Reds(i,:),Blues(J,:))<ShootDistanceB)
                % Shoot
                c2=line([Blues(J,1), Reds(i,1)-2],[Blues(J,2), Reds(i,2)],'Color','red','LineStyle','-.');
                pause(0.02);
                sound(gun,gunFs);
                delete(c2);
                if ( sqrt(deviationXR*deviationXR + deviationYR*deviationYR) < ImageWidth)
                     AttackBlue(1,J)=AttackBlue(1,J)+200;
               end
                 
            end
        end
    end
    %% Blues
    AttackRed=zeros(1,RedsNum);  
    for i=1:BluesNum
        if(Blues(i,15)>0)
            Blues = updateAtBoundary(Blues,i);
            CurrentBoid = Blues(i,:);
            [J,tmpDist]=findTarget(Blues(i,:),RedsNum,Reds);  
            if (J>0 && dist(Blues(i,:),Reds(J,:))<ShootDistanceB)
                % Shoot
                c2=line([Reds(J,1), Blues(i,1)-2],[Reds(J,2), Blues(i,2)],'Color','blue','LineStyle','-.');
                pause(0.02);
%                 sound(gun,gunFs);
                delete(c2);
                if ( sqrt(deviationXB*deviationXB + deviationYB*deviationYB) < ImageWidth)
                     AttackRed(1,J)=AttackRed(1,J)+200;
               end
                 
            end
        end
    end

    %% Update Blues
    [BluesNum,Blues] = UpdateBoid(AttackBlue,BluesNum,Blues);    
    %% Update Reds
    [RedsNum,Reds] = UpdateBoid(AttackRed,RedsNum,Reds); 
    
    RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
    RedrawRedsHP();
    RedrawBlueHP();
    % End of Moving Blues
    M(timeTick)=getframe; %For recording Video
    timeTick = timeTick+1;
end

[FlagPlot] = InitializeFlag(v_ImageFB,v_AlphaFB);
%% Record video
% MyMovie = VideoWriter('Column-Formation_CollisionAvoidanceBehavior.avi');
% open(MyMovie);
% writeVideo(MyMovie,M);
% close(MyMovie);
end