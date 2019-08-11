clear;

u0 = imread('test2.png');
u0 = im2double(u0);
u0 = imnoise(u0,'salt & pepper',0.1);
[m,n] = size(u0);
u = u0;



for i = 3:m-2
    for j = 3:n-2
               
        mean = 0;
        vr = 0;
        
        for x1 = -1:1:1
            for x2 = -1:1:1        
                mean = mean+ u(i+x1,j+x2);
                md(x1+2,x2+2) = u(i+x1,j+x2);
            end
        end
        l = median(md);
        mean = mean/9;

       for x1 = -1:1:1
            for x2 = -1:1:1
                
                B = ((u(i+x1,j+x2) == 1)||(u(i+x1,j+x2) == 0));
                
                if (B)
                    u(i+x1,j+x2) = (l(1,1)+mean)/2;
                end
                
            end
        end
        
        
    end
end

figure
subplot(1,3,1),
imshow(u0),title('Noised(S&P)');
subplot(1,3,2),
imshow(u),title('by Average method');
subplot(1,3,3),
imshow(medfilt2(u0)),title('Using "medfilt2"');