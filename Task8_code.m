clear;

u0 = imread('test2.png');
abc = u0;
u0 = im2double(u0);
u0 = imnoise(u0,'gaussian',0.1);
u0 = imnoise(u0,'salt & pepper',0.1);

u = Task8_func2(u0,10);
u = Task8_func3(u,0.01,30);

u2 = medfilt3(u0);
u2 = Task8_func3(u2,0.01,30);

figure
subplot(1,4,1),
imshow(u0),title('Noised(S&P+Gaussian)');
subplot(1,4,2),
imshow(u),title('by S&P-PDE + G-PDE');
subplot(1,4,3),
imshow(u2),title('by medfilt3 + G-PDE');
subplot(1,4,4),
imshow(abc),title('Actual Photo');
