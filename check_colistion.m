function check = check_colistion(boid, Target)
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
if count == 3
    check = 1;
else
check = 0;
end
end
