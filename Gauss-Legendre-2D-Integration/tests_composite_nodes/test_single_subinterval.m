function test_single_subinterval()
pause
fprintf('Test: Przypadek skrajny z jednym podprzedziałem - Start\n');
% Definiowanie przedziału i ustawienie liczby podprzedziałów na 1
a = -1; b = 1; n = 1;
fprintf('Testowanie dla przedziału [%d, %d] z jednym podprzedziałem.\n', a, b);

% Oczekiwany wynik
expected_output = [-7.7459666924148337704e-01;
    0.0000000000000000000e+00;
    7.7459666924148337704e-01];
fprintf('Oczekiwany wynik to standardowe węzły Gaussa-Legendra:\n');
fprintf('[%.4f; %.4f; %.4f]\n', expected_output);

% Pobieranie rzeczywistego wyniku z funkcji
actual_output = get_composite_nodes(a, b, n);
fprintf('Rzeczywisty wynik:\n');
fprintf('[%.4f; %.4f; %.4f]\n', actual_output);

% Sprawdzenie, czy rzeczywisty wynik zgadza się z oczekiwanym
assert(all(abs(actual_output - expected_output) < 1e-10));

fprintf('Test: Przypadek skrajny z jednym podprzedziałem - Koniec\n');
end