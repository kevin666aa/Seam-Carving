function seam_carving_decrease_height()

    im = imread("inputSeamCarvingPrague.jpg");
    im2 = imread("inputSeamCarvingMall.jpg");
    
    ei = (energy_img(im));
    ei2 = (energy_img(im2));
    
    for i = 1:50
        [im ei] = decrease_height(im, ei);
        [im2 ei2] = decrease_height(im2, ei2);
    end
    
    im = uint8(im);
    imshow(rescale(im));
    imwrite(im, "outputReduceHeightPrague.png");   
    
    
    im2 = uint8(im2);
    imshow(rescale(im2));
    imwrite(im2, "outputReduceHeightMall.png"); 