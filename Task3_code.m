clear all
I = imread('test.png');
f = rgb2gray(I);
f=im2double(f);
n_f = imnoise(f,'gaussian',0.1);

[x, y] = size(n_f);
Z0 = n_f;

Z1 = Z0;

for k = 1:20
    for i = 2:x - 1
        for j = 2: y -1
            Z1(i,j) = Z0(i,j) + 0.25*(Z0(i+1,j) -2*Z0(i,j)+Z0(i-1,j)) + 0.25*(Z0(i,j+1)-2*Z0(i,j)+Z0(i,j-1));
        end
    Z0 = Z1;
    end
end

figure
    imshow(n_f);
figure
    imshow(Z1);