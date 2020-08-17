% Group of:
% Yiran Wu, SID: 914704719
% Zuang Yu, SID: 915062968

function energyImg =  energy_img(im)
    Gscale_img = rgb2gray(im);
    [gx,gy] = imgradientxy(Gscale_img);
    energyImg = sqrt(gx.^2 + gy.^2);