clear;
for i = 0:100
    x(i+1,1) = i/100;
    if i<=50
        Ui(i+1,1) = i/100;
    else
        Ui(i+1,1) = 1- (i/100);
    end
end

u0=Ui;
u1(1,1) = u0(1,1);
u1(101,1) = u0(101,1);
n = 10000;

for i = 1:n
    for j = 2:100
        u1(j,1)=u0(j,1)+0.5*(u0(j+1,1)-2*u0(j,1)+u0(j-1,1));
    end
    u0 = u1;
    clf
    plot(x,u1)
    axis([0 1 0 1])
    pause(0.003)
end
