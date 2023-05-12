function [BoidsNum,Boids]=UpdateBoid(Attack,BoidsNum,Boids)
Point=zeros(1,BoidsNum);
after_Num = 0;
for i=1:BoidsNum
    if(Boids(i,15)>0)    
        Boids(i,15)=Boids(i,15)-Attack(1,i);     
%         after_Num = after_Num + 1;
    end
end
% BoidsNum = after_Num;
 