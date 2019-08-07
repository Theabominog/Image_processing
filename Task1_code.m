n = 10000;
for i = 0:100
    x(i+1,1) = i/100;
    if i<=50
        ux(i+1,1) = i/100;
    else
        ux(i+1,1) = 1- (i/100);
    end
end

u0=ux;
u1(1,1) = u0(1,1);
u1(101,1) = u0(101,1);

for i = 1:n
    for j = 2:100
        u1(j,1)=u0(j,1)+0.5*(u0(j+1,1)-2*u0(j,1)+u0(j-1,1));
    end
    u0 = u1;
    if i==10
        plot(x,u1)
        hold on
    elseif i==100
        plot(x,u1);
    elseif i==1000
        plot(x,u1);
    elseif i==5000
        plot(x,u1);
    end
end

plot(x,u1)

plot(x,ux)

hold off