function [ cost ] = move_cost( x1,y1,x2,y2, v_max,u,v )
%MOVE_COST Summary of this function goes here
%   Detailed explanation goes here
    
    cd = 3;
    
    tot_dist = sqrt((x1-x2)^2 + (y1-y2)^2);
    
    % Intializing travel time to some value
    t_init = tot_dist / v_max;
    t = t_init;
    
    % These will eventually be looked up from current map
    u_avg = (u(x1,y1) + u(x2,y2)) / 2;
    v_avg = (v(x1,y1) + v(x2,y2)) / 2;
    
    %Calculating the required velcity
    u_req = (x2 - x1) / t - u_avg;
    v_req = (x2 - x1) / t - v_avg;
    
    vel_req = sqrt(u_req^2 + v_req^2);
    
    if vel_req > v_max
        
        t_max = tot_dist / (v_max * .1);
        t_step = (t_max - t) / 100;
        % Loop increasing t to find a feasible time frame
        while (t < t_max && vel_req > v_max)
            t = t + t_step;
            
            u_req = (x2 - x1) / t - u_avg;
            v_req = (x2 - x1) / t - v_avg;
    
            vel_req = sqrt(u_req^2 + v_req^2);
        end
    end
    
    if vel_req < v_max
        % Travel cost is dependent on energy approximation
        cost = cd * vel_req^3 * t;
    else
        % We could not find a reasonable time to travel this path
        display('doing this...')
        cost = 1000;
    end
    
end

