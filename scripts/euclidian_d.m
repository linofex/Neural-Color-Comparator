function eucl_dist = euclidian_d(master, copy)
%EUCLIDIAN_D 
%This function calculates the distance between master and copy
    if nargin < 2
        disp("Usage: euclidian_d(master, copy)")
        return
    end
    
    master_size = size(master);
    copy_size = size(copy);
    if master_size ~= copy_size
        disp("Dimension error")
        return
    end
    eucl_dist = zeros(master_size(1), 1);
    for i = 1:master_size(1)
        eucl_dist(i) = de(master(i,:), copy(i,:));
    end
        
    end