function [ObstaclesPlot]=InitializeObstacles(v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6, v_ImageS7,v_AlphaS7, v_ImageS8,v_AlphaS8, v_ImageS9,v_AlphaS9, v_ImageS10,v_AlphaS10, v_ImageS11,v_AlphaS11, v_ImageS12,v_AlphaS12, v_ImageS13,v_AlphaS13, v_ImageS26,v_AlphaS26, v_ImageS27,v_AlphaS27, v_ImageS28,v_AlphaS28, v_ImageS29,v_AlphaS29, v_ImageS30,v_AlphaS30, v_ImageS31,v_AlphaS31)
global Obstacles;
global ObstaclesNum;
% Width=40;
%      for i=1:ObstaclesNum
%         plot(Obstacles(i,1),Obstacles(i,2),'o','MarkerSize',Obstacles(i,4)/2,'Color','b');
%     end

    %% canh cua hang rao 1
    angle = 30;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS3, angle);
    alpha_i = imrotate(v_AlphaS3, angle );
    ObstaclesPlot= image(Obstacles(31,1)-60, Obstacles(31,1)-150, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% canh cua hang rao 2
    angle = 60;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS3, angle);
    alpha_i = imrotate(v_AlphaS3, angle );
    ObstaclesPlot= image(Obstacles(31,1)+240, Obstacles(31,1)+130, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% canh cua hang rao 3
    angle = -120;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS3, angle);
    alpha_i = imrotate(v_AlphaS3, angle );
    ObstaclesPlot= image(Obstacles(31,1)+320, Obstacles(31,1)+260, img_i);
    ObstaclesPlot.AlphaData = alpha_i;

    %% vat can stone 1
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS7, angle);
    alpha_i = imrotate(v_AlphaS7, angle );
    ObstaclesPlot= image(Obstacles(31,1)-20, Obstacles(31,1)+250, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
   %% vat can stone 2
    angle = 180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS8, angle);
    alpha_i = imrotate(v_AlphaS8, angle );
    ObstaclesPlot= image(Obstacles(31,1)+360, Obstacles(31,1)-510, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% hang rao ben phai
    %%day thep gai
    angle = -40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1), Obstacles(31,1)-220, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = -70;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+110, Obstacles(31,1)-180, img_i);
    ObstaclesPlot.AlphaData = alpha_i;   
    
    %%day thep gai
    angle = 70;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+180, Obstacles(31,1)-100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;   
    
    %%day thep gai
    angle = 60;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+200, Obstacles(31,1), img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %%day thep gai
    angle = 5;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+175, Obstacles(31,1)+190, img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %%day thep gai
    angle = -5;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+140, Obstacles(31,1)+220, img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %% hang rao ben trai
    %%day thep gai
    angle = 15;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-150, Obstacles(31,1)-100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-200, Obstacles(31,1), img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 50;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-210, Obstacles(31,1)+100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 75;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-180, Obstacles(31,1)+200, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 130;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-110, Obstacles(31,1)+260, img_i);
    ObstaclesPlot.AlphaData = alpha_i;

    %% hang rao ben phai kho 2
    angle = -20;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+350, Obstacles(31,1)+170, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = -40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+460, Obstacles(31,1)+145, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = -40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+550, Obstacles(31,1)+145, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% hang rao ben trai kho 2
    
    angle = 35;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+260, Obstacles(31,1)+310, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = 65;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+260, Obstacles(31,1)+430, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = -65;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+330, Obstacles(31,1)+510, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% choi canh 1
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS6, angle);
    alpha_i = imrotate(v_AlphaS6, angle );
    ObstaclesPlot= image(Obstacles(31,1)+20, Obstacles(31,1)-120, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% choi canh 2
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS6, angle);
    alpha_i = imrotate(v_AlphaS6, angle );
    ObstaclesPlot= image(Obstacles(31,1)+180, Obstacles(31,1)+190, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% choi canh 3
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS6, angle);
    alpha_i = imrotate(v_AlphaS6, angle );
    ObstaclesPlot= image(Obstacles(31,1)+380, Obstacles(31,1)+255, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% hang rao ben phai
    %%day thep gai
    angle = -40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1), Obstacles(31,1)-220, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = -70;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+110, Obstacles(31,1)-180, img_i);
    ObstaclesPlot.AlphaData = alpha_i;   
    
    %%day thep gai
    angle = 70;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+180, Obstacles(31,1)-100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;   
    
    %%day thep gai
    angle = 60;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+200, Obstacles(31,1), img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %%day thep gai
    angle = 5;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+175, Obstacles(31,1)+190, img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %%day thep gai
    angle = -5;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+140, Obstacles(31,1)+220, img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %% hang rao ben trai
    %%day thep gai
    angle = 15;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-150, Obstacles(31,1)-100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-200, Obstacles(31,1), img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 50;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-210, Obstacles(31,1)+100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 75;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-180, Obstacles(31,1)+200, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %%day thep gai
    angle = 130;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)-110, Obstacles(31,1)+260, img_i);
    ObstaclesPlot.AlphaData = alpha_i;

    %% hang rao ben phai kho 2
    angle = -20;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+350, Obstacles(31,1)+170, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = -40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+460, Obstacles(31,1)+145, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = -40;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+550, Obstacles(31,1)+145, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% hang rao ben trai kho 2
    
    angle = 35;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+260, Obstacles(31,1)+310, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = 65;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+260, Obstacles(31,1)+430, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    angle = -65;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS9, angle);
    alpha_i = imrotate(v_AlphaS9, angle );
    ObstaclesPlot= image(Obstacles(31,1)+330, Obstacles(31,1)+510, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% choi canh 1
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS6, angle);
    alpha_i = imrotate(v_AlphaS6, angle );
    ObstaclesPlot= image(Obstacles(31,1)+20, Obstacles(31,1)-120, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% choi canh 2
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS6, angle);
    alpha_i = imrotate(v_AlphaS6, angle );
    ObstaclesPlot= image(Obstacles(31,1)+180, Obstacles(31,1)+190, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% choi canh 3
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS6, angle);
    alpha_i = imrotate(v_AlphaS6, angle );
    ObstaclesPlot= image(Obstacles(31,1)+380, Obstacles(31,1)+255, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% tuan tra ben trong 1
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS4, angle);
    alpha_i = imrotate(v_AlphaS4, angle );
    ObstaclesPlot= image(Obstacles(31,1), Obstacles(31,1)-120, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% tuan tra ben trong 2
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS4, angle);
    alpha_i = imrotate(v_AlphaS4, angle );
    ObstaclesPlot= image(Obstacles(31,1)+190, Obstacles(31,1)+180, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% tuan tra ben trong 3
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS4, angle);
    alpha_i = imrotate(v_AlphaS4, angle );
    ObstaclesPlot= image(Obstacles(31,1)+355, Obstacles(31,1)+315, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% o to
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS1, angle);
    alpha_i = imrotate(v_AlphaS1, angle );
    ObstaclesPlot= image(Obstacles(31,1)-100, Obstacles(31,1)-560, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% cay o hang rao
    angle = 180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS11, angle);
    alpha_i = imrotate(v_AlphaS11, angle );
    ObstaclesPlot= image(Obstacles(31,1)-200, Obstacles(31,1)+50, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% goc cay o hang rao
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS10, angle);
    alpha_i = imrotate(v_AlphaS10, angle );
    ObstaclesPlot= image(Obstacles(31,1)+180, Obstacles(31,1)-100, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% cay o ben phai
    angle = 180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS12, angle);
    alpha_i = imrotate(v_AlphaS12, angle );
    ObstaclesPlot= image(Obstacles(31,1)+400, Obstacles(31,1)-70, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
end