function [inflect_slope, inflect_yIntercept, inflection_point_idx] = findInflect(f, n, time_gap)
    df = zeros(1, n);
    df(1) = ( f(2) - f(1) )/time_gap;
    df(n) = ( f(n) - f(n-1) )/time_gap;
    for k = 2:(n-1)
        df(k) = ( f(k+1) - f(k-1) )/(2*time_gap);
    end
    
    inflection_point_idx = 0;
    for k = 2:(n-1)
        if df(k) < df(k-1)
            inflection_point_idx = k-1;
            break
        end
    end
    
    inflect_slope = df(inflection_point_idx);
    inflect_yIntercept = f(inflection_point_idx) - df(inflection_point_idx)*time_gap*(inflection_point_idx-1);
    