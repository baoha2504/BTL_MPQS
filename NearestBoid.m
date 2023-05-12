% Find nearest boid of the Leader, MinIndex is index of Boid in the flock
% BoidsFlag is a array to mark any boid is arranged to come to the desired point and do not need to be arrange
function [Nearest, BoidsFlag, MinIndex] = NearestBoid(Leader, BoidsFlag)
global BluesNum;
global Blues;
i = 1;
if (any(BoidsFlag))
    while (i < BluesNum && BoidsFlag(i) ~= 0)
        i = i + 1;
    end
end
d_min = dist(Leader(1:3), Blues(i,1:3));
while (d_min == 0 && i < BluesNum )
    i = i + 1;
    d_min = dist(Leader(1:3), Blues(i,1:3));
end

MinIndex = i;
for Index = 1:BluesNum
    if ((BoidsFlag(Index) == 0) && Index ~= MinIndex)
        vhl_o_pos = Blues(Index,1:3);
        d = dist(Leader(1:3), vhl_o_pos);
        if (d > 0) && (d < d_min)
            d_min = d;
            MinIndex = Index;
        end
    end
end
Nearest = Blues(MinIndex, :);
BoidsFlag(MinIndex) = 1;
end