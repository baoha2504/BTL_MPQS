function check = see_reds_target()
    global Reds RedsNum;
    global Blues BluesNum;
    global seeDistance;
    
    d = zeros(RedsNum, 1);
    for i=1:RedsNum
        for j = 1:BluesNum
            d(j) = dist(Blues(j, :), Reds(i,:));
        end
    end
    d_min = min(d);
    if d_min <= seeDistance
        check = 1;
    else 
        check = 0;
    end
end 