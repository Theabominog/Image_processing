clear all
I = imread('test.png');
f = rgb2gray(I);
f=im2double(f);
n_f = imnoise(f,'gaussian',0.1);

Z0 = n_f;

Z1 = Z0;

for k = 1:200
for i = 2:299
for j = 2:299
Z1(i,j) = Z0(i,j) + 0.25*(Z0(i+1,j) -2*Z0(i,j)+Z0(i-1,j)) + 0.25*(Z0(i,j+1)-2*Z0(i,j)+Z0(i,j-1));
end
Z0 = Z1;
end
end

figure
subplot(1,2,1),
imshow(n_f);
subplot(1,2,2),
imshow(Z1);
