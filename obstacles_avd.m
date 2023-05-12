function check = obstacles_avd(Target)
    global Blues;
    force = 0.3*steer_arrival(Blues(1,:), Target); 
    force = force + 1*steer_collision_avoidance(Blues(1,:));    
    Blues(1,:) = applyForce(Blues(1,:), force);
    Leader = Blues(1, :);            
    [Blues, BoidsIndex] = steer_Arrival_Formation_Column(Target, Blues, Leader, D_Behind);
    check = 1;
end