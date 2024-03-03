function test_error()
pause
fprintf('Test dla wielomianu stopnia 6 - Start\n');

% Definiowanie przedziału i liczby podprzedziałów
a = -1; b = 1; c = -1; d = 1; n = 1; m = 1;
fprintf(['Testowanie dla przedziałów [%d, %d] i [%d, %d] z liczbą ' ...
         'podprzedziałów n = %d, m = %d.\n'], a, b, c, d, n, m);

% Funkcja szóstego stopnia
f = @(x, y) 1.2*x.^6 - y.^6 + 0.8*x.^5.*y;
fprintf('f(x, y) = 1.2*x.^6 - y.^6 + 0.8*x.^5.*y\n');

% Oczekiwana wartość całki
expected_value = 4/35;
fprintf('Oczekiwana wartość całki dla funkcji rzędu 6: %.2f\n', expected_value);
fprintf('Metoda oparta na 3 węzłach, więc błąd powinien być substancjalny\n')

% (d-c)d1 + (b-a)d2 (c1 + d2) / m^6
% (d-c)d1 + (b-a)d2 (c1 + d2) / 2^6
% d1 = c1/m^2n
% d2 = d1/n^2n
% Przybliżona wartość całki obliczona przez funkcję
approx_value = P1Z30_LKR_CDIGL(f, a, b, c, d, n, m);
fprintf('Przybliżona wartość całki: %.2f\n', approx_value);
% Błąd bezwzględny
error = abs(approx_value - expected_value);
error_old = error;
fprintf('Błąd bezwzględny: %.2e\n', error);
n = 2; m = 2;
approx_value = P1Z30_LKR_CDIGL(f, a, b, c, d, n, m);
fprintf('Przybliżona wartość całki: %.2f\n', approx_value);

% Błąd bezwzględny
error = abs(approx_value - expected_value);
fprintf('Błąd bezwzględny: %.2e\n', error);

fprintf('is it equal %d %d\n', error, error_old/(2^6))
