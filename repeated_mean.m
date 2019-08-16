clear;

u0 = imread('cameraman.jpg');
abc = u0;
u0 = im2double(u0);
u0 = imnoise(u0,'salt & pepper',0.1);
[m,n] = size(u0);

u = u0;
u1 = u;
u_0=u;
u2 = u;

for i = 2:m -1
    for j = 2:n -1

        g(i,j) = func(u(i,j));

    end
end

 for t = 1:10;
    for i = 2:m -2
        for j = 2:n -2

            G(i,j) = g(i,j)/4;
           

        end
    end

    for i = 2:m -2
        for j = 2:n -2

            u1(i,j) = u(i,j) + ((G(i,j)*(u(i+1,j)-u(i,j))) - (G(i,j)*(u(i,j)-u(i-1,j))) + (G(i,j)*(u(i,j+1)-u(i,j)))-(G(i,j)*(u(i,j)-u(i,j-1))));

        end
        u = u1;
    end

    for j = 2:m -2
        for i = 2:n -2

            u2(i,j) = u_0(i,j) + ((G(i,j)*(u_0(i+1,j)-u_0(i,j))) - (G(i,j)*(u_0(i,j)-u_0(i-1,j))) + (G(i,j)*(u_0(i,j+1)-u_0(i,j)))-(G(i,j)*(u_0(i,j)-u_0(i,j-1))));

        end
    end
            u_0 = (u2 + u1)/2;
end
%u5 = (u+u_0)/2;
figure
subplot(1,5,1),
imshow(u0),title('Noised(S&P)');
subplot(1,5,2),
imshow(u),title('by Horizontal');
subplot(1,5,3),
%imshow(u_0),title('by V');
subplot(1,5,4),
imshow(abc),title('Actual Photo');
subplot(1,5,5),
imshow(u_0),title('mean');
    
    
