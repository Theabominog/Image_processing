clear;

u0 = imread('test2.png');
abc = u0;
u0 = im2double(u0);
u0 = imnoise(u0,'gaussian',0.1);
u0 = imnoise(u0,'salt & pepper',0.1);

[m,n] = size(u0);
u = u0;

for i = 3:m-1
    for j = 3:n-2
               
        mean = 0;

        for x1 = -1:1:1
            for x2 = -1:1:1        
                mean = mean+ u(i+x1,j+x2);
                med12(x1+2,x2+2) = u(i+x1,j+x2);
            end
        end

        l = median(med12);

       for x1 = -1:1:1
            for x2 = -1:1:1
                
                B = ((u(i+x1,j+x2) == 1)||(u(i+x1,j+x2) == 0));
                
                if (B)
                    u(i+x1,j+x2) = l(1,1);
                end
                
            end
        end
        
        
    end
end

u1 = u;

lambda = 0.007;

for t = 1:70;

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

uk = medfilt2(u0);
u2 = uk;
lambda = 0.01;

for t = 1:30

    for i = 2:m -1
        for j = 2:n -1

            ux(i,j) = (uk(i+1,j) - uk(i-1,j))^2/2;
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

            u2(i,j) = uk(i,j) + (Gx1(i,j)*(uk(i+1,j)-uk(i,j))) - (Gx2(i,j)*(uk(i,j)-uk(i-1,j))) + (Gy1(i,j)*(uk(i,j+1)-uk(i,j)))-(Gy2(i,j)*(uk(i,j)-uk(i,j-1)));

        end
        uk = u2;

    end

end


figure
subplot(1,4,1),
imshow(u0),title('Noised(S&P+Gaussian)');
subplot(1,4,2),
imshow(u),title('by Average method + GPDE');
subplot(1,4,3),
imshow(u2),title('Using "medfilt2" + GPDE');
subplot(1,4,4),
imshow(abc),title('Actual Photo');
