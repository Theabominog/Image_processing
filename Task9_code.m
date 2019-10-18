clear;

u0 = imread('raw5.jpg');
u = u0;
u0 = im2double(u0);

u0 = filter_gray(u0);

u0 = Task8_func3(u0,0.01,100,0.1);

figure

subplot(1,2,1),
imshow(u),title('Actual Photo');

subplot(1,2,2),
imshow(u0),title('Denoised');