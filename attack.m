function attack()
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
[v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6, v_ImageS7,v_AlphaS7, v_ImageS8,v_AlphaS8, v_ImageS9,v_AlphaS9, v_ImageS10,v_AlphaS10, v_ImageS11,v_AlphaS11, v_ImageS12,v_AlphaS12, v_ImageS13,v_AlphaS13, v_ImageS26,v_AlphaS26, v_ImageS27,v_AlphaS27, v_ImageS28,v_AlphaS28, v_ImageS29,v_AlphaS29, v_ImageS30,v_AlphaS30, v_ImageS31,v_AlphaS31]=LoadImageOther1();
[v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF,v_ImageF,v_AlphaF,v_ImageBB1,v_AlphaBB1, v_ImageBB2,v_AlphaBB2]=LoadImageBase();
[v_ImageFR,v_AlphaFR,v_ImageFB,v_AlphaFB]=LoadImageFlag();

% draw graphic
[fHandler]=InitializeGraphicN();

% draw base

[BasesPlot]=InitializeBase(v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF,...
    v_ImageBB1,v_AlphaBB1, v_ImageBB2,v_AlphaBB2);


% draw obstacles
InitializeObstacles(v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6, v_ImageS7,v_AlphaS7, v_ImageS8,v_AlphaS8, v_ImageS9,v_AlphaS9, v_ImageS10,v_AlphaS10, v_ImageS11,v_AlphaS11, v_ImageS12,v_AlphaS12, v_ImageS13,v_AlphaS13, v_ImageS26,v_AlphaS26, v_ImageS27,v_AlphaS27, v_ImageS28,v_AlphaS28, v_ImageS29,v_AlphaS29, v_ImageS30,v_AlphaS30);

[RedsPlot]=InitializeBoid(v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsNum,Reds);
[RedsHP]=InitializeHP(RedsNum,MaxRedNum,Reds);

[BluesPlot]=InitializeBoid(v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesNum,Blues);
[BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

%%load sound
[back, backFS, bomb,gun, alert,fight,bombFs,gunFs,fightFs, alertFS, win, winFS]=loadSound();
soundback = audioplayer(back, backFS);
play(soundback)

%% Initialize the  positon of Goal
points = [-180 380 0 0 0 0; 350 350 0 0 0 0; 330 -190 0 0 0 0;-170 -260 0 0 0 0];

pointsRed = [-500 0 0 0 0 0; -400 350 0 0 0 0];
titleStr = 'Tuan Tra Quanh Can Cu';
titleStr = [titleStr newline ''];
title(titleStr);

%% calculate agents' positions to move to each iteration
setappdata(0, 'OldTarget', Targets(1, 1:3));

%% INITIALIZE COLUMN-FORMATION FOR FLOCK
Blues(1,1:3) = [10 -400 0];
Blues(1,:) = applyForce(Blues(1,:), 0);
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

%% INITIALIZE REd COLUMN-FORMATION FOR FLOCK
%Reds(1,1:3) = [-550 -480 0];
Reds(1,:) = applyForce(Reds(1,:), 0);
LeaderRed = Reds(1, :);
BehindPosition  = LeaderRed;
BoidIndex = 2;
while BoidIndex <= RedsNum
    %Find the RightBeside position of RightBesidePosition (2-nd Boid)
    BehindPosition = FindBehindLeader(BehindPosition,D_Behind);
    Reds(BoidIndex, 1:6) = BehindPosition;
    BehindPosition = Reds(BoidIndex,:);
    Reds(BoidIndex,:) = applyForce(Reds(BoidIndex,:), 0);
       
    BoidIndex = BoidIndex + 1;
end

%% code tuan tra
timeTick = 1;
i = 1;
j = 1;
a = true;
count = 0;
while a
     if timeTick > 620
         %% Wander Reds
        posRed = pointsRed(j, :);
        if check_reach_obstacles(LeaderRed) == 1
            Goals = posRed;
        end
          %% Moving the 1-st Boid (as a leader)
       
        force_arrRed = 0.8*steer_arrival(Reds(1,:), posRed); %Move toward the mouse
        avd_forceRed= steer_collision_avoidance(Reds(1,:));
        forceRed = force_arrRed + avd_forceRed*0.03;
        Reds(1,:) = applyForce(Reds(1,:), forceRed);
        %% Moving reds
        LeaderRed = Reds(1, :);            
        [Reds, RedIndex] = steer_Arrival_Formation_Column2(posRed, Reds, LeaderRed, 40);
       
        if check_reach_Leader(Reds, posRed) == 1
            j = mod(j + 1, 2);
            if j==0
                j = 2;
            end
        end 
        % redraw
       % RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    end
    disp('Hamacute--------------------------------');
   
   %% blues
    pos = points(i, :);
    if check_reach_obstacles(Leader) == 1
        Goals = pos;
    end
     %% Moving the 1-st Boid (as a leader)
    force_arr = 0.8*steer_arrival(Blues(1,:), pos); %Move toward the mouse
    avd_force= steer_collision_avoidance(Blues(1,:));
    force = force_arr + avd_force*0.03;
    Blues(1,:) = applyForce(Blues(1,:), force);
     %% Moving Blues
    Leader = Blues(1, :);            
    [Blues, BoidsIndex] = steer_Arrival_Formation_Column(pos, Blues, Leader, D_Behind);
    if check_reach_Leader(Blues, pos) == 1
        i = mod(i + 1, 4);
        if i==0
            i = 4;
        end
        disp('-------------------------------------');
        disp(i);
    end 
    
    RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
    RedrawRedsHP();
    RedrawBlueHP();
   timeTick = timeTick+1;
   disp("----------------------------------------");
   disp(timeTick)
   
   %% break
    if see_reds_target() == 1
        soundalert = audioplayer(alert, alertFS);
        play(soundalert);
        InitializeImageGate(v_ImageS5,v_AlphaS5,v_ImageS31,v_AlphaS31);
        a = false;
    end
end

titleStr = 'Phat Hien Dich Va Bao Dong';
titleStr = [titleStr newline ''];
title(titleStr);

point_evade = [-900 -300 0 0 0 0];
%% when reds and blues attack 
timeTick = 1;
ik = 1;

Leader = Blues(ik, :);
jk = 1;

win = -1;

while true
red_alive = RedsNum;
blue_alive = BluesNum;
       %% Moving Blues
        for BlueIndex = 1:BluesNum
            Blues = updateAtBoundary(Blues,BlueIndex);
            CurrentBlue = Blues(BlueIndex, :);
            
            arr_force = steer_pursue_arrival(CurrentBlue, Reds(jk,:));
            avd_force = steer_collision_avoidance(Blues(BlueIndex,:)); 
            coh_force = 0.4*steer_cohesion(CurrentBlue);
            eva_force = 0.3 * steer_evade(CurrentBlue,Reds(jk,:), 4, 60);
            force = 0.6*arr_force + avd_force*0.6 + coh_force + 0.7*steer_separation(CurrentBlue) + eva_force;     
           
            if dist(CurrentBlue, Reds(jk,:)) < 150
            % N?u kho?ng c�ch b� h?n 150, Blues gi? nguy�n t?i v? tr� ?ang ??ng
                force = 10; %  c� l?c t�c ??ng ph?n l?i
             
            end
            Blues(BlueIndex,:) = applyForce(CurrentBlue, force);
                
        end
        
        %% Wander Reds
        force_arrRed = steer_arrival(Reds(jk,:), point_evade); %Move toward the mouse
        avd_forceRed= steer_collision_avoidance(Reds(jk,:));
        forceRed = force_arrRed + avd_forceRed*0.03;
        Reds(jk,:) = applyForce(Reds(jk,:), forceRed);
        
        %% Moving reds
        LeaderRed = Reds(jk, :);            
        [Reds, RedIndex] = steer_Arrival_Formation_Column2(posRed, Reds, LeaderRed, 40);
       
        %% ABC        
        for i = 1:RedsNum
            if Reds(i, 15) <= 0
                red_alive = red_alive -1;
            end
        end
        
        for i = 1:BluesNum
            if Blues(i, 15) <= 0
                blue_alive = blue_alive -1;
            end
        end
        
        if LeaderRed(15) <= 0
            jk = jk +1;
            LeaderRed  = Reds(jk,:);
        end
        
        if Leader(15) <= 0
            ik = ik + 1;
            Leader = Blues(ik, :);
        end
       
        if red_alive == 0
            win = 1;
            break;
        end
        
       if blue_alive == 0
            win = 0;
            break;
       end
        
        disp("!!!!!!!!!!!!!!!!!!"+ red_alive);
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
            [J,tmpDist]=findTarget(Blues(i,:),RedsNum,Reds);  
            if (J>0 && dist(Blues(i,:),Reds(J,:))<ShootDistanceB)
                % Shoot
                c2=line([Reds(J,1), Blues(i,1)-2],[Reds(J,2), Blues(i,2)],'Color','blue','LineStyle','--');
                pause(0.02);
                sound(gun,gunFs);
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

if win == 0
    titleStr = 'Quan Dich Chien Thang';
    titleStr = [titleStr newline ''];
    title(titleStr);
    stop(soundalert)
    soundwin = audioplayer(bomb,bombFs);
    play(soundwin);
    sound(win, winFS);
    InitializeImageWin(v_ImageS13,v_AlphaS13)  
end

if win == 1    
    titleStr = 'Quan Ta Chien Thang';
    titleStr = [titleStr newline ''];
    title(titleStr);
    stop(soundalert)
    soundwin = audioplayer(win, winFS);
    play(soundwin);
    sound(win, winFS);
    InitializeImageWin(v_ImageS2,v_AlphaS2) 
end

