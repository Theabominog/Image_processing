function y = Task8_func2(u,time)
    
    [m,n] = size(u);
    
    u1 = u;

    for i = 2:m -1
        for j = 2:n -1
            G(i,j) = Task8_func(u(i,j));
        end
    end
    
for t = 1:time
    for i = 2:m -2
        for j = 2:n -2
    
            u1(i,j) = u(i,j) + ((G(i,j)*(u(i+1,j)-u(i,j))) - (G(i,j)*(u(i,j)-u(i-1,j))) + (G(i,j)*(u(i,j+1)-u(i,j)))-(G(i,j)*(u(i,j)-u(i,j-1))));
    
        end
        u = u1;
    end
end

y = u1;