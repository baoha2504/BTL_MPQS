function main()
%% Global variables
global TimeSteps;
TimeSteps = 100000;
global RedsNum;
global Targets;
global BluesNum;
% global Blues;
global RangeView;
global MaxBlueNum MaxRedNum FightsNum;
MaxBlueNum =10;
MaxRedNum =15;
FightsNum =2;
% Set global variables
SET_GLOBAL_VARIABLES();
SetObstacles();
SetGoals();
BluesNum = randi([6, 9]);   % Choose number of Blue to demo
RedsNum = randi([3, 6]);    % Choose number of Red to demo
Targets = zeros(3,RedsNum);
RangeView= 0;
attack();
end