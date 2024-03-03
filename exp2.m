function y = exp2(X)
% Funkcja licząca w wartości exp2 dla każdego X
% W pobliżu 0 używająmy rozwiniecia (1/n!) * x^(n-1) * 2 do 4 elementu
% Autor: Łukasz Kryczka

col = iscolumn(X);
% ustawiamy precyzję rozwinięcia taylora na 4 co drugie wartości
precision = 4;
coefficients = 0:2:(precision*2)-1;
factorials = [1 (2:2:(2*precision)-1).*(3:2:(2*(precision)))];
factorials = cumprod(factorials)./2;

% Kalkulujemy wartości x osobną metodą dla x w otoczeniu 0  
border_val = 0.05;
normal_idx = (X >= -25) & (X <= -border_val) | (X >= border_val) & (X <= 25);
taylor_idx = (X > -border_val) & (X < border_val);

if col
    X = X';
end

y(normal_idx) = (exp(X(normal_idx))-exp(-X(normal_idx)))./X(normal_idx);
if any(taylor_idx)
    y(taylor_idx) = sum((X(taylor_idx).^(coefficients'))./(factorials'));
end

if col
    y = y';
end