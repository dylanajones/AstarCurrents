function [ cost ] = hueristic( x1,y1,x2,y2, v_max )
%HUERISTIC Calculates the h cost of a node
%   Detailed explanation goes here

    cd = 3;
    
    tot_dist = sqrt((x1-x2)^2 + (y1-y2)^2);
    
    t_req = tot_dist / v_max;
    
    cost = cd * v_max^3 * t_req;
end

