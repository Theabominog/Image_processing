function im_error(u0, u1)
    e1 = u1 - u0;
    e1 = e1.*e1;
    fprintf("the error is %d", sum(e1, 'all'))
end