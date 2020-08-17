function imout = enlarge_img_width(im, s)
    xlen = size(im,1);
    ylen = size(im,2);
    cme = cumulative_min_energy_map(energy_img(im),"VERTICAL");
    
    % 1. find all of the seams
    seam_arr = [];
    for i = 1:s
        vs = find_vertical_seam(cme);
        seam_arr = [seam_arr ; vs];
        for j = 1:xlen
            cme(j, vs(j)) = Inf;
        end
    end
    
    % 2. update seam indicies
    seam_arr = sortrows(seam_arr);

    for k = 1:size(seam_arr, 1)
       seam_arr(k, :) = seam_arr(k, :) + k -1 ; 
    end
   
    % 3. insert all of the seams into the matricies
    r = mat2cell(im(:,:,1), ones(1, xlen));
    g = mat2cell(im(:,:,2), ones(1, xlen));
    b = mat2cell(im(:,:,3), ones(1, xlen));
    for i = 1:s
        seam = seam_arr(i,:);
        for j = 1:xlen
            line = cell2mat(r(j));
            line = [line(1:seam(j)) line(seam(j):size(line, 2))];
            r(j) = mat2cell(line, 1);
            
            line = cell2mat(g(j));
            line = [line(1:seam(j)) line(seam(j): ylen + i -1)];
            g(j) = mat2cell(line, 1);
            
            line = cell2mat(b(j));
            line = [line(1:seam(j)) line(seam(j): ylen + i -1)];
            b(j) = mat2cell(line, 1);
        
        end
    end
    r= cell2mat(r);
    g= cell2mat(g);
    b= cell2mat(b);
    imout = cat(3, r, g, b);
    
            
    
    
   