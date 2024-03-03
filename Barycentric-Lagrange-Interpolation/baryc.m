function wagi = baryc(wezly)
    % Autor: Łukasz Kryczka
    % Funkcja licząca wagi dla postaci barycentrycznej interpolacji
    % Lagrange'a
    
    wagi = zeros(size(wezly));
    if iscolumn(wezly)
        wezly=wezly';
    end

    j = 0;
    for xj = wezly
        wspolczynnik = 1;
        for xi = wezly
            if (xj == xi)
                continue
            end
            wspolczynnik = wspolczynnik * (xj - xi);
        end
        j = j + 1;
        wagi(j) = 1 ./ wspolczynnik;
    end