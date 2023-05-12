function check = check_reach_obstacles(boid)
    global Obstacles;
    
    for i=1:11
        d = dist(boid(1:3), Obstacles(i, 1:3));
    end
    disp(d);
    if (d<= 200)
        check = 1;
    else
        check = 0;
    end
 
end