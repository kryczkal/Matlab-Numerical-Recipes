function y = invpowmult(A,k,x)
% Autor: Łukasz Kryczka
% Funkcja licząca przybliżoną wartość x w równianiu A^(-k)  * x
% poprzez rozwiązanie równania A^(-k) * x = b <==> A^(k) * b = x
% dla wartości b.
% AAb = x <==> Ay = x, Ab = y, itd...
y = x;
A = A';
for i = 1:k
    y = iterative_solver(A,y);
end
y = y(:);