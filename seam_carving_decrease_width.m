function seam_carving_decrease_width()

    im = imread("inputSeamCarvingPrague.jpg");
    im2 = imread("inputSeamCarvingMall.jpg");
    
    ei = (energy_img(im));
    ei2 = (energy_img(im2));
    
    for i = 1:100
        [im ei] = decrease_width(im, ei);
        [im2 ei2] = decrease_width(im2, ei2);
    end
    
    im = uint8(im);
    imshow(rescale(im));
    imwrite(im, "outputReduceWidthPrague.png");   
    
    
    im2 = uint8(im2);
    imshow(rescale(im2));
    imwrite(im2, "outputReduceWidthMall.png"); 