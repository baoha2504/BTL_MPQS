function [v_ImageFR,v_AlphaFR,v_ImageFB,v_AlphaFB]=LoadImageFlag()

[v_ImageFR, ~, v_AlphaFR]	= imread('FlagR.png');
v_ImageFR = imresize(v_ImageFR, [100 400], 'lanczos3' );
v_AlphaFR = imresize(v_AlphaFR, [100 400], 'lanczos3' );

[v_ImageFB, ~, v_AlphaFB]	= imread('missioncompleted.png');
v_ImageFB = imresize(v_ImageFB, [200 600], 'lanczos3' );
v_AlphaFB = imresize(v_AlphaFB, [200 600], 'lanczos3' );