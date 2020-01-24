u_0 = imread("lena_gray_256.tif");
u_0 = im2double(u_0);
u_1 = imnoise(u_0, 'speckle', 0.4)
[y, z] = grid_scan(u_0, u_1);

save('bakwas.mat', 'y', 'z');