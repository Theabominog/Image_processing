function [array, final] = grid_scan(image, noised)
    l = 1;
    size_grid = 5;
    [x, y] = size(image);
    logic = noised - image;
    matrix = zeros(x - size_grid * y - size_grid, size_grid^2);
    logic_matrix = zeros(x - size_grid * y - size_grid, 1);
    for i = 1:x - size_grid
       for j = 1:y - size_grid
       temp_array = image(i:i+(size_grid - 1), j:j+ (size_grid - 1));
       logic_array = logic(i:i+(size_grid - 1), j:j+ (size_grid - 1));
       temp_array = reshape(temp_array, 1, size_grid^2);
       logic_array = reshape(logic_array, 1, size_grid^2);
       m = logic_array(ceil((size_grid^2)/2));
       if m > 0.3
           m = 1;
       else 
           m = 0;
       end
       matrix(l, :) = temp_array;
       logic_matrix(l, 1) = m;       
       l = l + 1;
       end
    end
    
    array = matrix;
    final = logic_matrix;
end