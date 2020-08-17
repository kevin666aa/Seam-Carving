function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    xlen = size(cumulativeEnergyMap, 1);
    ylen = size(cumulativeEnergyMap, 2);
    cur_ind = find(min(cumulativeEnergyMap(xlen,:)) == cumulativeEnergyMap(xlen,:));
    verticalTemp(1) = cur_ind(1);
    cur_ind = cur_ind(1);
   
    for i = (xlen-1) : -1 : 1 
        %disp(cur_ind)
        if cur_ind == 1
            vec = [cumulativeEnergyMap(i,cur_ind) cumulativeEnergyMap(i,cur_ind +1)];
            cur_ind = cur_ind + find(min(vec) == vec)-1; 
            cur_ind = cur_ind(1);
        elseif cur_ind == ylen
            vec = [cumulativeEnergyMap(i,cur_ind-1) cumulativeEnergyMap(i,cur_ind)];
            cur_ind = cur_ind + find(min(vec) == vec)-2;
            cur_ind = cur_ind(1);
        elseif (cur_ind > 1) & (cur_ind < ylen)
            vec = [cumulativeEnergyMap(i,cur_ind-1) cumulativeEnergyMap(i,cur_ind) cumulativeEnergyMap(i,cur_ind+1)];
            cur_ind = cur_ind + find(min(vec) == vec) - 2;
            cur_ind = cur_ind(1);
        end
        %disp(cur_ind);nh
        verticalTemp = [verticalTemp cur_ind];
        
    end
    verticalSeam = flip(verticalTemp);