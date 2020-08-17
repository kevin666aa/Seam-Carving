function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)
    seam = find_horizontal_seam(energyImg);
    xlen = size(energyImg, 1);
    ylen = size(energyImg, 2);
    im = double(im);
    
    for i = 1:ylen        
        im(seam(i), i, 1) = -1;
        im(seam(i), i, 2) = -1;
        im(seam(i), i, 3) = -1;
        energyImg(seam(i), i) = -1;
    end
    r = im(:,:,1);
    g = im(:,:,2);
    b = im(:,:,3);
    energyImg = (energyImg);
    
    r = r(:);
    g = g(:);
    b = b(:);
    energyImg = energyImg(:);
    
    r(r==-1) = [];
    g(g==-1) = [];
    b(b==-1) = [];
    energyImg(energyImg == -1) = [];
    
    r = reshape(r, xlen - 1, ylen);
    g = reshape(g, xlen - 1, ylen);
    b = reshape(b, xlen - 1, ylen);
        
    reducedColorImg = cat(3, r, g, b);
    reducedEnergyImg = reshape(energyImg, xlen - 1, ylen);

    