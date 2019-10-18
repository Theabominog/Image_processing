function y = Task8_func3(u,lambda,time,k);
    
[m,n] = size(u);
u1 = u;

for t = 1:time

    for i = 2:m -1
        for j = 2:n -1
    
            ux(i,j) = (u(i+1,j) - u(i-1,j))^2/4;
            uy(i,j) = (u(i,j+1) - u(i,j-1))^2/4;
    
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
    
            u1(i,j) = u(i,j) +(k*(Gx1(i,j)*(u(i+1,j)-u(i,j))) - (Gx2(i,j)*(u(i,j)-u(i-1,j))) + (Gy1(i,j)*(u(i,j+1)-u(i,j)))-(Gy2(i,j)*(u(i,j)-u(i,j-1))));
    
        end
    end
    u = u1;
end

y = u1;