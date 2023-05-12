% Weight Function of Goal seeking behavior and Column-Formation
function [WeightsMatrix] = WeightFunction_CollisionAvoidance_Formation_Column(Boids, BoidsNum, D_Behind)

% Weight for the 1-st Boid
WeightsMatrix(1) = 1;
% Calculate weight for other Boids
for Index = 2:BoidsNum
    % Calculate the goal following force (the force to make boid go to the goal)
    f_goal = steer_collision_avoidance(Boids(Index,:));
    if (any(f_goal))        
        BehindLeader = FindBehindLeader(Boids(1,:), D_Behind);
        f_formation = steer_pursue_arrival(Boids(Index,:), BehindLeader);
        % Calculate weights for the other boids except 1-st and 2-nd Boids
        WeightsMatrix(Index) = mag(f_formation) / mag(f_goal);
    else
        WeightsMatrix(Index) = 1;
    end
end
end