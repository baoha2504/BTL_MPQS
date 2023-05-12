function [BasesPlot]=InitializeBase(v_ImageBB,v_AlphaBB,v_ImageBR,v_AlphaBR,v_ImageBF,v_AlphaBF,...
    v_ImageBB1,v_AlphaBB1, v_ImageBB2,v_AlphaBB2)
global BaseB;
global BaseR;

%%base field
    angle = -180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBF, angle);
    alpha_i = imrotate(v_AlphaBF, angle );
    BasesPlot= image(-600, -600, img_i);
    BasesPlot.AlphaData = alpha_i;  
%%base 1
    angle = -180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBR, angle);
    alpha_i = imrotate(v_AlphaBR, angle );
    BasesPlot= image(BaseR(1) - 150, BaseR(2) - 200, img_i);
    BasesPlot.AlphaData = alpha_i;   

%%base 2
    angle = -180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBB, angle);
    alpha_i = imrotate(v_AlphaBB, angle);
    BasesPlot= image(BaseB(1) +100, BaseB(2) + 50, img_i);
    BasesPlot.AlphaData = alpha_i;  
    
    %%base 1_2
    angle = -180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBR, angle);
    alpha_i = imrotate(v_AlphaBR, angle );
    BasesPlot= image(-50, 0, img_i);
    BasesPlot.AlphaData = alpha_i;   
    
    % choi
%     angle = 180;	% imrotate rotates ccw     
%     img_i = imrotate(v_ImageChoi, angle);
%     alpha_i = imrotate(v_AlphaChoi, angle );
%     BasesPlot= image(70, -100, img_i);
%     BasesPlot.AlphaData = alpha_i;   
%     
    angle = -180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBB1, angle);
    alpha_i = imrotate(v_AlphaBB1, angle);
    BasesPlot= image(-450, 300, img_i);
    BasesPlot.AlphaData = alpha_i;  
    
    angle = -180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBB2, angle);
    alpha_i = imrotate(v_AlphaBB2, angle);
    BasesPlot= image(-520, -30 , img_i);
    BasesPlot.AlphaData = alpha_i;  
    