clear;

u0 = imread('Test2.jpg');
u = u0;
u0 = im2double(u0);

u0 = filter_gray(u0);

u0 = Task8_func2(u0,50,0.2,0.8);

figure

subplot(1,2,1),
imshow(u),title('Actual Photo');

subplot(1,2,2),
imshow(u0),title('Denoised');