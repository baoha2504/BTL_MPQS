function [ObstaclesPlot]=InitializeImageWin(v_ImageS2,v_AlphaS2)
global Obstacles;
global ObstaclesNum;


    %% blue win
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageS2, angle);
    alpha_i = imrotate(v_AlphaS2, angle );
    ObstaclesPlot= image(Obstacles(31,1)-320, Obstacles(31,1), img_i);
    ObstaclesPlot.AlphaData = alpha_i;

end