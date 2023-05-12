function [v_ImageS1,v_AlphaS1,v_ImageS2,v_AlphaS2,v_ImageS3,v_AlphaS3,v_ImageS4,v_AlphaS4,v_ImageS5,v_AlphaS5,v_ImageS6,v_AlphaS6, v_ImageS7,v_AlphaS7, v_ImageS8,v_AlphaS8, v_ImageS9,v_AlphaS9, v_ImageS10,v_AlphaS10, v_ImageS11,v_AlphaS11, v_ImageS12,v_AlphaS12, v_ImageS13,v_AlphaS13, v_ImageS26,v_AlphaS26, v_ImageS27,v_AlphaS27, v_ImageS28,v_AlphaS28, v_ImageS29,v_AlphaS29, v_ImageS30,v_AlphaS30, v_ImageS31,v_AlphaS31]=LoadImageOther1()

[v_ImageS1, ~, v_AlphaS1]	= imread('truck.png');
v_ImageS1 = imresize(v_ImageS1, [100 250], 'lanczos3' );
v_AlphaS1 = imresize(v_AlphaS1, [100 250], 'lanczos3' );

[v_ImageS2, ~, v_AlphaS2]	= imread('FlagB.png');
v_ImageS2 = imresize(v_ImageS2, [200 628], 'lanczos3' );
v_AlphaS2 = imresize(v_AlphaS2, [200 628], 'lanczos3' ); 

[v_ImageS3, ~, v_AlphaS3]	= imread('minigate.png');
v_ImageS3 = imresize(v_ImageS3, [40 90], 'lanczos3' );
v_AlphaS3 = imresize(v_AlphaS3, [40 90], 'lanczos3' );

[v_ImageS4, ~, v_AlphaS4]	= imread('patrol.png');
v_ImageS4 = imresize(v_ImageS4, [60 45], 'lanczos3' );
v_AlphaS4 = imresize(v_AlphaS4, [60 45], 'lanczos3' );

[v_ImageS5, ~, v_AlphaS5]	= imread('alert.png');
v_ImageS5 = imresize(v_ImageS5, [30 30], 'lanczos3' );
v_AlphaS5 = imresize(v_AlphaS5, [30 30], 'lanczos3' );

[v_ImageS6, ~, v_AlphaS6]	= imread('boom.png');
v_ImageS6 = imresize(v_ImageS6, [100 70], 'lanczos3' );
v_AlphaS6 = imresize(v_AlphaS6, [100 70], 'lanczos3' );

[v_ImageS7, ~, v_AlphaS7]	= imread('stone5.png');
v_ImageS7 = imresize(v_ImageS7, [200 200], 'lanczos3' );
v_AlphaS7 = imresize(v_AlphaS7, [200 200], 'lanczos3' );

[v_ImageS8, ~, v_AlphaS8]	= imread('tree2.png');
v_ImageS8 = imresize(v_ImageS8, [250 250], 'lanczos3' );
v_AlphaS8 = imresize(v_AlphaS8, [250 250], 'lanczos3' );

[v_ImageS9, ~, v_AlphaS9]	= imread('thepgaidai.png');
v_ImageS9 = imresize(v_ImageS9, [100 100], 'lanczos3' );
v_AlphaS9 = imresize(v_AlphaS9, [100 100], 'lanczos3' );

[v_ImageS10, ~, v_AlphaS10]	= imread('root.png');
v_ImageS10 = imresize(v_ImageS10, [80 80], 'lanczos3' );
v_AlphaS10 = imresize(v_AlphaS10, [80 80], 'lanczos3' );

[v_ImageS11, ~, v_AlphaS11]	= imread('tree1.png');
v_ImageS11 = imresize(v_ImageS11, [150 150], 'lanczos3' );
v_AlphaS11 = imresize(v_AlphaS11, [150 150], 'lanczos3' );

[v_ImageS12, ~, v_AlphaS12]	= imread('tree3.png');
v_ImageS12 = imresize(v_ImageS12, [200 200], 'lanczos3' );
v_AlphaS12 = imresize(v_AlphaS12, [200 200], 'lanczos3' );

[v_ImageS13, ~, v_AlphaS13]	= imread('FlagR.png');
v_ImageS13 = imresize(v_ImageS13, [200 628], 'lanczos3' );
v_AlphaS13 = imresize(v_AlphaS13, [200 628], 'lanczos3' );

[v_ImageS26, ~, v_AlphaS26]	= imread('thepgaidai.png');
v_ImageS26 = imresize(v_ImageS26, [100 100], 'lanczos3' );
v_AlphaS26 = imresize(v_AlphaS26, [100 100], 'lanczos3' );

[v_ImageS27, ~, v_AlphaS27]	= imread('thepgaidai.png');
v_ImageS27 = imresize(v_ImageS27, [100 100], 'lanczos3' );
v_AlphaS27 = imresize(v_AlphaS27, [100 100], 'lanczos3' );

[v_ImageS28, ~, v_AlphaS28]	= imread('thepgaidai.png');
v_ImageS28 = imresize(v_ImageS28, [100 100], 'lanczos3' );
v_AlphaS28 = imresize(v_AlphaS28, [100 100], 'lanczos3' );

[v_ImageS29, ~, v_AlphaS29]	= imread('thepgaidai.png');
v_ImageS29 = imresize(v_ImageS29, [100 100], 'lanczos3' );
v_AlphaS29 = imresize(v_AlphaS29, [100 100], 'lanczos3' );

[v_ImageS30, ~, v_AlphaS30]	= imread('thepgaidai.png');
v_ImageS30 = imresize(v_ImageS30, [100 100], 'lanczos3' );
v_AlphaS30 = imresize(v_AlphaS30, [100 100], 'lanczos3' );

[v_ImageS31, ~, v_AlphaS31]	= imread('gate.png');
v_ImageS31 = imresize(v_ImageS31, [70 70], 'lanczos3' );
v_AlphaS31 = imresize(v_AlphaS31, [70 70], 'lanczos3' );

