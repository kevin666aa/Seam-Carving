function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
    seam = find_vertical_seam(energyImg);
    xlen = size(energyImg, 1);
    ylen = size(energyImg, 2);
    im = double(im);
    
    for i = 1:xlen        
        im(i, seam(i), 1) = -1;
        im(i, seam(i), 2) = -1;
        im(i, seam(i), 3) = -1;
        energyImg(i, seam(i)) = -1;
    end
    r = im(:,:,1).';
    g = im(:,:,2).';
    b = im(:,:,3).';
    energyImg = (energyImg.');
    
    r = r(:);
    g = g(:);
    b = b(:);
    energyImg = energyImg(:);
    
    r(r==-1) = [];
    g(g==-1) = [];
    b(b==-1) = [];
    energyImg(energyImg == -1) = [];
    
    r = reshape(r, ylen-1, xlen).';
    g = reshape(g, ylen-1, xlen).';
    b = reshape(b, ylen-1, xlen).';
        
    reducedColorImg = cat(3, r, g, b);
    reducedEnergyImg = reshape(energyImg, ylen-1, xlen).';

    