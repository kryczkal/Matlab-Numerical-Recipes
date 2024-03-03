function D = f(x, y, A, B)
% f - Oblicza pochodne funkcji y w punkcie x
%
% Funkcja oblicza wartości pochodnych funkcji y w punkcie x, wykorzystując
% metodę Adamsa-Bashfortha-Moultona. Zwraca wektor pochodnych, gdzie każdy
% element odpowiada kolejnym pochodnym funkcji y.
%
% Wejście:
% x      - Wartość zmiennej niezależnej dla obliczanych pochodnych.
% y      - Wektor wartości y i jej pochodnych do rzędu m-1, w postaci
%          [y, y', y'', ..., y^{(m-1)}].
% A      - Tablica komórkowa funkcji a_0, a_1, ..., a_{m-1} w postaci 
%          {@a0, @a1, ..., @am-1}.
% B      - Uchwyt do funkcji b, reprezentujący prawą stronę równania
%          różniczkowego, przyjmujący x i y.
%
% Wyjście:
% D      - Wektor pochodnych y w x. Zawiera pochodne do rzędu m, gdzie
%          y^{m} jest obliczane z równania: y^{(m)} = (-a_0 y - ... - 
%          a_{m-1} y^{(m-1)} + B) / a_m.
%
% Uwagi:
% Wartości pochodnych y', ..., y^{(m-1)} są przekazywane jako elementy
% y. Pochodna y^{(m)} jest obliczana z równania różniczkowego oraz
% funkcji a_i i B.

D = zeros(size(y));
D(1:end-1) = y(2:end);
D(end) = (-sum(cellfun(@(f) f(x), A(1:end-1)) .* y(1:end), "all") + B(x, y))...
     / cellfun(@(f) f(x), A(end));