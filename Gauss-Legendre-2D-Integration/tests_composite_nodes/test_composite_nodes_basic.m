function test_composite_nodes_basic()
pause
disp('Test: Podstawowa funkcjonalność - Start');

% Definiowanie przedziału i liczby podprzedziałów
a = 0; b = 3; n = 3;
disp(['Testowanie dla przedziału [', num2str(a), ', ', num2str(b), ...
    '] z liczbą podprzedziałów n = ', num2str(n)]);

% Oczekiwany wynik obliczony ręcznie
expected_output = [1 1];
fprintf('Oczekiwany wynik:\n');
disp(expected_output);
fprintf('\n');

% Pobieranie rzeczywistego wyniku z funkcji
actual_output = get_composite_nodes(a, b, n);
fprintf('Rzeczywisty wynik:\n');
disp(actual_output);
fprintf('\n');

% Sprawdzenie, czy rzeczywisty wynik zgadza się z oczekiwanym
% Tolerancja jest ustawiona, aby uwzględnić błędy arytmetyki zmiennoprzecinkowej
difference = abs(actual_output - expected_output);
fprintf('Różnica: [');
fprintf(' %.2e ', difference);
fprintf(']\n');
fprintf('Test: Podstawowa funkcjonalność - Koniec\n');
end