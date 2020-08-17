function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
    xlen = size(cumulativeEnergyMap, 1);
    ylen = size(cumulativeEnergyMap, 2);
    cur_ind = find(min(cumulativeEnergyMap(:,ylen)) == cumulativeEnergyMap(:,ylen));
    horizontalTemp(1) = cur_ind(1);
    cur_ind = cur_ind(1);
   
    for i = (ylen-1) : -1 : 1
        if cur_ind == 1
            vec = [cumulativeEnergyMap(cur_ind,i) cumulativeEnergyMap(cur_ind +1,i)];
            cur_ind = cur_ind + find(min(vec) == vec)-1; 
            cur_ind = cur_ind(1);
        elseif cur_ind == xlen
            vec = [cumulativeEnergyMap(cur_ind-1,i) cumulativeEnergyMap(cur_ind,i)];
            cur_ind = cur_ind + find(min(vec) == vec)-2;
            cur_ind = cur_ind(1);
        elseif (cur_ind > 1) & (cur_ind < xlen)
            vec = [cumulativeEnergyMap(cur_ind-1, i) cumulativeEnergyMap(cur_ind, i) cumulativeEnergyMap(cur_ind+1, i)];
            cur_ind = cur_ind + find(min(vec) == vec) - 2;
            cur_ind = cur_ind(1);
        end
        %disp(cur_ind);
        horizontalTemp = [horizontalTemp cur_ind];
        
    end
    horizontalSeam = flip(horizontalTemp);