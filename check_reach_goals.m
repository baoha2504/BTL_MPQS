function check = check_reach_goals(boid, Target)
global BluesNum;
count = 0;
for RedsIndex = 1: BluesNum
    v_post = boid(RedsIndex,1:3); 
    d = dist(v_post, Target(1:3)); 
    disp(d); 
    if(d <= 100)
        count = count + 1;
    end  
end
if count == BluesNum
    check = 1;
else
check = 0;
end
end
