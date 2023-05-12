function Behavior__Arrival_Formation_Column()
%% global variables
global TimeSteps;
% global BluesNum;
% global Blues;
% global Targets;
% global SaveMousePosition;
% global saveText;
% global saveText;
% global TimeSteps;
global Reds RedsNum MaxRedNum RedsHP DieRNum DameOfRed;
global Blues BluesNum MaxBlueNum BluesHP DieBNum DameOfBlue;
global Fights FightsNum MaxFightNum ObstaclesF ;
global Booms BoomsNum Targets TargetsNum;
global SaveMousePosition;
global ImageWidth;
global ObstaclesB ObstaclesNumB;
global ObstaclesR ObstaclesNumR;
global Obstacles ObstaclesNum;
global ShootDistanceB ShootDistanceR;
global kB kR Target1 Target2;
global deviationXB deviationYB deviationXR deviationYR ;
global AccuracyB AccuracyR;
global goToAttack;
goToAttack = 0;
global makeInformation;
makeInformation = zeros(1,RedsNum);
global Counter;
global FleeDistance;
% Distance behind leader in the Column-formation
D_Behind = 60; 

%% first draw
% load image
[v_ImageR,v_AlphaR,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE]=LoadImageBoids();
[v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6]=LoadImageOther1();
[v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF,v_ImageF,v_AlphaF]=LoadImageBase();
[v_ImageBoom,v_AlphaBoom,v_ImageN,v_AlphaN,v_ImageEmpty,v_AlphaEmpty]=LoadImageBoom();
[v_ImageFR,v_AlphaFR,v_ImageFB,v_AlphaFB]=LoadImageFlag();
% draw graphic
[fHandler]=InitializeGraphicN();

% draw base

[BasesPlot]=InitializeBase(v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF);
[BoomsPlot]=InitializeBoom(v_ImageBoom,v_AlphaBoom,v_ImageEmpty,v_AlphaEmpty,Booms,BoomsNum);
[FightsPlot]=InitializeFight(v_ImageF,v_AlphaF);

% draw obstacles
InitializeObstacles(v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6,v_ImageBR,v_AlphaBR)

[RedsPlot]=InitializeBoid(v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsNum,Reds);
[RedsHP]=InitializeHP(RedsNum,MaxRedNum,Reds);

[BluesPlot]=InitializeBoid(v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesNum,Blues);
% [BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

%%load sound
[bomb,gun,fight,bombFs,gunFs,fightFs]=loadSound();


%Initialize the first positon of Goal
MousePosition = [0 400 0 0 0 0];
SaveMousePosition = plot(MousePosition(1), MousePosition(2), 'o','MarkerSize',15,'MarkerFaceColor','yellow','Color','yellow');
saveText = text(MousePosition(1) + 30, MousePosition(2)+ 10, 'Goal');
titleStr = 'Hanh quan den diem tap ket';
titleStr = [titleStr newline '(Dung chuot de chon diem den)'];
title(titleStr);
set(fHandler, 'WindowButtonDownFcn',@cursorClickCallback);

%Event Mouse click
    function cursorPosition = cursorClickCallback(o,e)
        p = get(gca,'CurrentPoint');
        cursorPosition(1:2) = p(1,1:2);
        cursorPosition(3:6) = 0;
        MousePosition = cursorPosition;
        %Delete the old Target and Redraw a new Target
        delete(SaveMousePosition);
        %Draw Circle - Targer
        SaveMousePosition = plot(MousePosition(1), MousePosition(2), 'o','MarkerSize',15,'MarkerFaceColor','yellow','Color','yellow');
        delete(saveText);
        saveText = text(MousePosition(1) + 30, MousePosition(2)+ 10, 'Goal');
        kB=1;
        kR=1;
    end

%% calculate agents' positions to move to each iteration
setappdata(0, 'OldTarget', Targets(1, 1:3));

%% INITIALIZE COLUMN-FORMATION FOR FLOCK
Blues(1,1:3) = [-300 -500 0];
Blues(1,:) = applyForce(Blues(1,:), 0);
Reds(1,1:3) = [100 100 0];
Reds(1,:) = applyForce(Reds(1,:), 0);

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
RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
[BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

RedrawBoid(Blues,BluesNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
[RedsHP]=InitializeHP(RedsNum,MaxRedNum,Reds);

%% FLOCK MOVE TO THE GOAL
% Generate random colors for drawing the footprints of Blues
for BoidIndex = 1:BluesNum
    randomColors(BoidIndex,1:3) = rand(1,3);
end

timeTick = 1;
while (timeTick < TimeSteps)
    %% Moving the 1-st Boid (as a leader)
    %force = steer_arrival(Blues(1,:), MousePosition); %Move toward the mouse
    force_arr = steer_arrival(Blues(1,:), MousePosition); %Move toward the mouse
    avd_force1=steer_collision_avoidance(Blues(1,:));
    force = force_arr + avd_force1*0.05;
    Blues(1,:) = applyForce(Blues(1,:), force);
    
    %% Moving Blues
    Leader = Blues(1, :);            
    [Blues, BoidsIndex] = steer_Arrival_Formation_Column(MousePosition, Blues, Leader, D_Behind);
    
    if(check_reach_target(Blues, MousePosition))
       break; 
    end
    
    
    % ------------------ Flee obstacles -----------
    for BlueIndex = 1:BluesNum
        Blues = updateAtBoundary(Blues,BlueIndex);
        CurrentBoid = Blues(BlueIndex, :);
        force_arr = steer_arrival(CurrentBoid, MousePosition);
        avd_force1=steer_collision_avoidance(CurrentBoid);
        force = force_arr*1 + avd_force1;
%         disp(force);
%         w = waitforbuttonpress;
        Blues(BlueIndex,:) = applyForce(CurrentBoid, force);     
    end
    
    %% Wander Reds
    RedIndex = 1;
    for RedIndex = 1:RedsNum
        % steering
        Reds = updateAtBoundary(Reds,RedIndex);
        
        CurrentBoid = Reds(RedIndex, :);
        force = steer_wander(CurrentBoid);
        Reds(RedIndex,:) = applyForce(CurrentBoid, force);                
    end
    % redraw
    RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    % ---------------- Attack ---------------------
    
      %Reds
    AttackBlue = zeros(1,BluesNum);
    for i=1:RedsNum
      if(Reds(i,15)>0)
            Reds = updateAtBoundary(Reds,i);
            CurrentBoid = Reds(i, :);
            [J,tmpDist]=findTarget(Reds(i,:),BluesNum,Blues);       
            if (J>0 && dist(Reds(i,:),Blues(J,:))<ShootDistanceB)
                %shoot
                display("====")
                c1=line([Reds(i,1), Blues(J,1)],[Reds(i,2), Blues(J,2)],'Color','red','LineStyle','-.');
                Reds(i, 15) = Reds(i,15) - DameOfBlue;
                sound(gun,gunFs);
                pause(0.02);
                delete(c1);
                if ( sqrt(deviationXR*deviationXR+deviationYR*deviationYR) < ImageWidth) 
                    AttackBlue(1,J)=AttackBlue(1,J)+40; 
                end

            end 

        end
    end
        Reds = updateAtBoundary(Reds,i);
        CurrentBoid = Reds(i, :);

        if(CurrentBoid(:,15) > 0)
            Reds(i,:) = applyForce(CurrentBoid, force);
        end
   %Blues
    AttackRed=zeros(1,RedsNum);  
    for i=1:BluesNum
        if(Blues(i,15)>0)
            Blues = updateAtBoundary(Blues,i);
            CurrentBoid = Blues(i,:);
            [J,tmpDist]=findTarget(Blues(i,:),RedsNum,Reds);  
            if (J>0 && dist(Blues(i,:),Reds(J,:))<ShootDistanceB)
                % Shoot
                display("====")
                c2=line([Reds(J,1), Blues(i,1)-2],[Reds(J,2), Blues(i,2)],'Color','blue','LineStyle','-.');
                Blues(i, 15) = Blues(i,15) - DameOfRed;
                pause(0.02);
                sound(gun,gunFs);
                delete(c2);
                if ( sqrt(deviationXB*deviationXB + deviationYB*deviationYB) < ImageWidth)
                     AttackRed(1,J)=AttackRed(1,J)+50;
               end
                 
            end
        end
    end 




%%--------------------------------------------------------------------------
   
  

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
InitializeFlag (v_ImageFB,v_AlphaFB);
%% Record video
MyMovie = VideoWriter('Column-Formation_GoalSeeking.avi');
open(MyMovie);
writeVideo(MyMovie,M);
close(MyMovie);
end