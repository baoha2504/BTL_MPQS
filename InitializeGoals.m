function [ObstaclesPlot]=InitializeGoals(v_ImageG,v_AlphaG)
global Goals;
% Width=40;
%      for i=1:ObstaclesNum
%         plot(Obstacles(i,1),Obstacles(i,2),'o','MarkerSize',Obstacles(i,4)/2,'Color','b');
%     end
%% Dich den
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageG, angle);
    alpha_i = imrotate(v_AlphaG, angle );
    ObstaclesPlot = image(Goals(1,1)-45, Goals(1,2)-45, img_i);
    ObstaclesPlot.AlphaData = alpha_i;   


end