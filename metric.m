clear all;
u0 = imread("test.png");
u0 = im2double(u0);
u1 = imnoise(u0, 'gaussian', 0.01);

figure;
imshow(u0)
figure;
imshow(u1)

im_error(u0, u1)
