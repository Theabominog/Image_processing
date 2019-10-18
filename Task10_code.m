clear;
u0 = imread('raw5.jpg');

u0 = filter_gray(u0);

D = grad_x_y(u0);

figure

subplot(1,2,1),
imshow(u0),title('Actual Photo');

subplot(1,2,2),
imshow(D),title('Grad');