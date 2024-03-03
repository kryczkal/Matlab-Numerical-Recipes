function y = euclidean_norm(v)
% Autor: Łukasz Kryczka
% funkcja liczaca normę euklidesową wektora

y  = 0;
for i = 1:length(v)
    y = y + v(i)*v(i);
end
y = sqrt(y);