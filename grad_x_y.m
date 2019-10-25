function y = grad_x_y(u)

[m,n] = size(u);

ux = zeros(m,n);
uy = zeros(m,n);
y = zeros(m,n);

for i = 2:m -1
    for j = 2:n -1
    
        ux(i,j) = (u(i+1,j) - u(i-1,j))^2/4;
        uy(i,j) = (u(i,j+1) - u(i,j-1))^2/4;
        y(i,j) = (ux(i,j)+uy(i,j));
        
    end
end