function y = Task8_func(x,max_pepper,min_salt)
    if(x >= min_salt || x<=max_pepper)
        y = 0.25;
    else
        y = 0;
    end
end