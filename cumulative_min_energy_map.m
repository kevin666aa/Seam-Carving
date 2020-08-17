function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
    xlen = size(energyImg, 1);
    ylen = size(energyImg, 2);
    if (seamDirection == "VERTICAL")
        for i = 2: (xlen)
            for j = 1 : (ylen)
                if j == 1
                    min_above = min(energyImg(i-1,j), energyImg(i-1, j+1));
                elseif j == ylen
                    min_above = min(energyImg(i-1,j), energyImg(i-1, j-1));
                else
                    min_above = min(min(energyImg(i-1,j), energyImg(i-1, j+1)), energyImg(i-1, j-1));
                end
                energyImg(i, j) = energyImg(i,j) + min_above;
            end
        end
        cumulativeEnergyMap = energyImg;
  
    elseif (seamDirection == "HORIZONTAL")
        for j = 2: (ylen)
            for i = 1 : (xlen)
                if i == 1
                    min_left = min(energyImg(i,j-1), energyImg(i+1, j-1));
                elseif i == xlen
                    min_left = min(energyImg(i,j-1), energyImg(i-1, j-1));
                else 
                    min_left = min(min(energyImg(i,j-1), energyImg(i+1, j-1)), energyImg(i-1, j-1));
                end
                energyImg(i, j) = energyImg(i,j) + min_left;
            end
        end
        cumulativeEnergyMap = energyImg;
        
    else
        error("Wrong Direction")
    end