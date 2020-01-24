D = "C:\Users\Murtuza Ali\Documents\image processing";
S = dir(fullfile(D));
n = 10;

for i = 3:6
    m = fullfile(D, S(i).name);
    u = imread(m);
    u = im2double(u);
    u_0 = rgb2gray(u);
    u_1 = imnoise(u_0, 'speckle', 0.4);
    u_2 = u_1 - u_0;
    [x, y] = size(u_2);
    u_3 = reshape(u_2, 1, x*y);
    for j = 1:x*y
       if (u_2(j) > 0.3)
           u_3(j) = 1;
       else
           u_3(j) = 0;
       end
    end
    u_3 = reshape(u_3, x, y);
    file_name = (S(i).name(1:end-4) + "_final.jpg");
    noise_data_file_name = (S(i).name(1:end-4) + "_noise_final.jpg");
    file_name = (S(i).name(1:end-4) + "_logic_final.jpg");
    imwrite(u_1, file_name);
    imwrite(u_2, noise_data_file_name, 'jpg');
    imwrite(u_3, file_name);
end