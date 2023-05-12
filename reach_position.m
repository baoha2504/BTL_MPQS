function check = reach_position(Boid, Target)
    d = dist(Boid(1:3), Target(1:3));
    if d <= 80
        check = 1;
    else
        check = 0;
    end
    
end