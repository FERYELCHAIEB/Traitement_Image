function Valpsnr = psnr(I,If)
[m,n] = size(I);
somme = 0;
Z = double(I) - double(If);
for i=1:m;
    for j=1:n;
        somme = somme+(Z(i,j)*Z(i,j));
    end
end
E = somme/(m*n);
Valpsnr = 10*log((255*255)/E);


