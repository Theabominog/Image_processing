clear;

u0 = imread('test2.png');
abc = u0;
u0 = im2double(u0);
u0 = imnoise(u0,'salt & pepper',0.1);
[m,n] = size(u0);

u = u0;
u1 = u;

for i = 2:m -1
    for j = 2:n -1

        g(i,j) = func(u(i,j));

    end
end

 for t = 1:10;
    for i = 2:m -2
        for j = 2:n -2

            Gx1(i,j) = g(i,j)/4;
            Gx2(i,j) = g(i,j)/4;
            Gy1(i,j) = g(i,j)/4;
            Gy2(i,j) = g(i,j)/4;

        end
    end

    for i = 2:m -2
        for j = 2:n -2

            u1(i,j) = u(i,j) + ((Gx1(i,j)*(u(i+1,j)-u(i,j))) - (Gx2(i,j)*(u(i,j)-u(i-1,j))) + (Gy1(i,j)*(u(i,j+1)-u(i,j)))-(Gy2(i,j)*(u(i,j)-u(i,j-1))));

        end
        u = u1;
    end
end



figure
subplot(1,4,1),
imshow(u0),title('Noised(S&P)');
subplot(1,4,2),
imshow(u),title('by PDE');
subplot(1,4,3),
imshow(abc),title('Actual Photo');
subplot(1,4,4),
imshow(medfilt3(u0)),title('medfilt3');
