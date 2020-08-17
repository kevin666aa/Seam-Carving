function view_seam(im,seam,seamDirection)
    xlen = size(im, 1);
    ylen = size(im, 2);
    fig = figure;
    imshow(im);
    hold on;
    
    if (seamDirection == "VERTICAL")
        for i = 1 : xlen
           plot(seam(i), i, 'r.', 'MarkerSize', 1);
        end
        saveas(fig, "vs.png");
    elseif (seamDirection == "HORIZONTAL")
        for j = 1 : ylen
            plot(j, seam(j), 'g.', 'MarkerSize', 1);
        end 
        saveas(fig, "hs.png");
    else
        error("Wrong Direction")
        

    end