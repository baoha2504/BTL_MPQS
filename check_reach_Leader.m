function check = check_reach_Leader(Boid, Target)
v_post = Boid(1,1:3); 
count = 0;
d = dist(v_post, Target(1:3)); 
disp(d); 
if(d <= 100)
   count = 1;
end

if count == 1
    check = 1;
else
    check = 0;
end 