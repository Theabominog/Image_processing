clear;
u0 = imread('test.png');
u0 = rgb2gray(u0);
u0 = im2double(u0);
u0 = imnoise(u0,'gaussian',0.1);


[x, y] = size(u0);
u = u0;

u1 = u;

lambda = 0.001;

for t = 1:5

    for i = 2:x - 1
        for j = 2:y - 1

            ux(i,j) = (u(i+1,j) - u(i-1,j))^2/2; %#ok<*SAGROW>
            uy(i,j) = (u(i,j+1) - u(i,j-1))^2/2;


               g(i,j) = 1/(1+((ux(i,j)+uy(i,j))/(lambda ^2)));
        end
    end

    for i = 2:x - 2
        for j = 2:y - 2

            Gx1(i,j) = (g(i,j)+g(i+1,j))/2;
            Gx2(i,j) = (g(i,j)+g(i-1,j))/2;
            Gy1(i,j) = (g(i,j)+g(i,j+1))/2;
            Gy2(i,j) = (g(i,j)+g(i,j-1))/2;

        end
    end

    for i = 2:x - 2
        for j = 2:y - 2

            u1(i,j) = u(i,j) + (Gx1(i,j)*(u(i+1,j)-u(i,j))) - (Gx2(i,j)*(u(i,j)-u(i-1,j))) + (Gy1(i,j)*(u(i,j+1)-u(i,j)))-(Gy2(i,j)*(u(i,j)-u(i,j-1)));

        end
        u = u1;

    end

end

figure
    imshow(u0);
figure
    imshow(u1);