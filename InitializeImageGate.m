function [ObstaclesPlot]=InitializeImageGate(v_ImageS5,v_AlphaS5,v_ImageS31,v_AlphaS31)
global Obstacles;
global ObstaclesNum;


    %% canh cua 1
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS31, angle);
    alpha_i = imrotate(v_AlphaS31, angle );
    ObstaclesPlot= image(Obstacles(31,1)-60, Obstacles(31,1)-150, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% canh cua 2
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS31, angle);
    alpha_i = imrotate(v_AlphaS31, angle );
    ObstaclesPlot= image(Obstacles(31,1)+240, Obstacles(31,1)+130, img_i);
    ObstaclesPlot.AlphaData = alpha_i; 
    
    %% canh cua 3
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS31, angle);
    alpha_i = imrotate(v_AlphaS31, angle );
    ObstaclesPlot= image(Obstacles(31,1)+320, Obstacles(31,1)+260, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
   	%% chuong bao dong 1
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS5, angle);
    alpha_i = imrotate(v_AlphaS5, angle );
    ObstaclesPlot= image(Obstacles(31,1)+43, Obstacles(31,1)-30, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% chuong bao dong 2
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS5, angle);
    alpha_i = imrotate(v_AlphaS5, angle );
    ObstaclesPlot= image(Obstacles(31,1)+203, Obstacles(31,1)+280, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
    
    %% chuong bao dong 3
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS5, angle);
    alpha_i = imrotate(v_AlphaS5, angle );
    ObstaclesPlot= image(Obstacles(31,1)+403, Obstacles(31,1)+345, img_i);
    ObstaclesPlot.AlphaData = alpha_i;
end