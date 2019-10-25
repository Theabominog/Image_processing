function y = var_mat(u,v)

    k = u - v;

    k = k.*k;

    [m,n] = size(k);

y = 100*sum(k,'all')/(m*n);