function  y = filter_gray(u0)
    
    [~,~,o] = size(u0);

    if(o ~= 1)
        u0 = rgb2gray(u0);
    else
        %DO NOTHING
    end

    y = u0;