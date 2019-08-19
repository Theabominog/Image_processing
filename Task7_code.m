clear;

u0 = imread('test2.png');
abc = u0;
u0 = im2double(u0);
u0 = imnoise(u0,'gaussian',0.1);
u0 = imnoise(u0,'salt & pepper',0.1);

[m,n] = size(u0);

u = u0;
u1 = u;

for i = 2:m -1
    for j = 2:n -1
        G(i,j) = Task8_func(u(i,j));
    end
end

for t = 1:10
    for i = 2:m -2
        for j = 2:n -2

            u1(i,j) = u(i,j) + ((G(i,j)*(u(i+1,j)-u(i,j))) - (G(i,j)*(u(i,j)-u(i-1,j))) + (G(i,j)*(u(i,j+1)-u(i,j)))-(G(i,j)*(u(i,j)-u(i,j-1))));

        end
        u = u1;
    end
end

lambda = 0.01;

for t = 1:30

    for i = 2:m -1
        for j = 2:n -1

            ux(i,j) = (u(i+1,j) - u(i-1,j))^2/2;
            uy(i,j) = (u(i,j+1) - u(i,j-1))^2/2;


            g(i,j) = 1/(1+((ux(i,j)+uy(i,j))/(lambda^2)));
        end
    end

    for i = 2:m -2
        for j = 2:n -2

            Gx1(i,j) = (g(i,j)+g(i+1,j))/2;
            Gx2(i,j) = (g(i,j)+g(i-1,j))/2;
            Gy1(i,j) = (g(i,j)+g(i,j+1))/2;
            Gy2(i,j) = (g(i,j)+g(i,j-1))/2;

        end
    end

    for i = 2:m -2
        for j = 2:n -2

            u1(i,j) = u(i,j) + (Gx1(i,j)*(u(i+1,j)-u(i,j))) - (Gx2(i,j)*(u(i,j)-u(i-1,j))) + (Gy1(i,j)*(u(i,j+1)-u(i,j)))-(Gy2(i,j)*(u(i,j)-u(i,j-1)));

        end
        u = u1;
    end
end

figure
subplot(1,3,1),
imshow(u0),title('Noised(S&P+Gaussian)');
subplot(1,3,2),
imshow(u),title('by S&P_PDE + GPDE');
subplot(1,3,3),
imshow(abc),title('Actual Photo');
