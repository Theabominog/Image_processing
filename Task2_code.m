clear all
for i=0:100
for j = 0:100
Z_0(i+1,j+1) = sin(pi*i/100)*sin(pi*j/100);
x(1,i+1) = i/100;
y(1,i+1) = i/100;
end
end

Z0 = Z_0;

Z1 = Z0;

for k = 1:1000
for i = 2:100
for j = 2:100
Z1(i,j) = Z0(i,j) + 0.25*(Z0(i+1,j) -2*Z0(i,j)+Z0(i-1,j)) + 0.25*(Z0(i,j+1)-2*Z0(i,j)+Z0(i,j-1));
end
Z0 = Z1;
end
end

hold on
zlim([0 1])
mesh(x,y,Z1);
view(-35, 14)
hold off