% Test 3: Duża liczba podprzedziałów
function test_large_number_of_sub_intervals()
pause
fprintf('Test: Duża liczba podprzedziałów - Start\n');

% Definiowanie przedziału i ustawienie dużej liczby podprzedziałów
a = 0; b = 1; n = 1000;
fprintf('Testowanie dla przedziału [%d, %d] z liczbą podprzedziałów n = %d.\n', a, b, n);

% Pobieranie wyniku z funkcji
actual_output = get_composite_nodes(a, b, n);
fprintf('Sprawdzanie rozmiaru wyniku:\n');

% Sprawdzenie, czy funkcja zwraca wynik o odpowiedniej wielkości
expected_size = [3, n];
actual_size = size(actual_output);
fprintf('Oczekiwany rozmiar: [%d %d]\n', expected_size);
fprintf('Rzeczywisty rozmiar: [%d %d]\n', actual_size);

assert(all(actual_size == expected_size));

fprintf('Sprawdzanie zakresu wartości węzłów:\n');
fprintf('(Powinny nie przekraczać zakresu [%d %d])\n', a, b);
fprintf('Ewalujemy nnz(actual_output(:, :) >= a & actual_output(:, :) <= b\n')
fprintf("Wartość oczekiwana \n")
disp(3000)
fprintf("Wartość rzeczywista\n")
disp(nnz(actual_output(:, :) >= a & actual_output(:, :) <= b))

fprintf('Test: Duża liczba podprzedziałów - Koniec\n');
end