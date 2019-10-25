clear;

u0 = imread('cameraman.tif');
abc = u0;
u0 = im2double(u0);
u0 = imnoise(u0,'speckle',0.1);

u = Task8_func3(u0,0.01,75,0.2);

figure
subplot(1,3,1),
imshow(u0),title('Photo');
subplot(1,3,2),
imshow(u),title('Denoised');
subplot(1,3,3),
imshow(abc),title('Original');
