function [inflex_slope, inflex_yIntercept, inflexion_point_idx] = findInflex(f, n, time_gap)
    df = zeros(1, n);
    df(1) = ( f(2) - f(1) )/time_gap;
    df(n) = ( f(n) - f(n-1) )/time_gap;
    for k = 2:(n-1)
        df(k) = ( f(k+1) - f(k-1) )/(2*time_gap);
    end
    
    inflexion_point_idx = 0;
    for k = 2:(n-1)
        if df(k) < df(k-1)
            inflexion_point_idx = k-1;
            break
        end
    end
    
    inflex_slope = df(inflexion_point_idx);
    inflex_yIntercept = f(inflexion_point_idx) - df(inflexion_point_idx)*time_gap*(inflexion_point_idx-1);
    