clear;
u0 = imread('cameraman.tif');

u0 = filter_gray(u0);
u0 = imnoise(u0,'Salt & Pepper',0.1);
u0 = imnoise(u0,'Gaussian',0.1);
D = grad_x_y(u0);

imwrite(u0,'Test2.jpg','JPEG');

figure

subplot(1,2,1),
imshow(u0),title('Actual Photo');

subplot(1,2,2),
imshow(D),title('Grad');