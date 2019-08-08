clear;
for i=0:100
    for j = 0:100
        Z(i+1,j+1) = sin(pi*i/100)*sin(pi*j/100);
        x(1,i+1) = i/100;
        y(1,i+1) = i/100;
    end
end


u1 = Z;
k = 10000;

for n = 1:k
    for i = 2:100
        for j = 2:100
            u1(i,j) = Z(i,j) + 0.25*(Z(i+1,j) -2*Z(i,j)+Z(i-1,j)) + 0.25*(Z(i,j+1)-2*Z(i,j)+Z(i,j-1));
        end
    Z = u1;
    end
    clf
    zlim =([ 0 1])
    mesh(x,y,u1)
    pause(0.01)
end
