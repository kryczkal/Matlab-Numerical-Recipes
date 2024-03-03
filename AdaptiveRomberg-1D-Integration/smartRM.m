function [Q, err, n_wierszy, wiersz_dol] = smartRM(g, a, b, tol, M0, Kmin, Kmax)
    % Autor: Łukasz Kryczka
    % Funkcja licząca całkę z funkcji g, na przedziale a,b, z tolerancją
    % błedu tol, w adaptacyjny sposób od M0 przedziałów z minimalnie 
    % Kmin krokami ekstrapolacji i maksymalnie Kmax krokami ekstrapolacji.

    H = (b-a)/(M0+1); % liczymy zlozona calke trapezow dla M0+1 przedzialow
    wiersz_gora = H*(sum(g(a+H:H:b-H))+(g(a)+g(b))/2);

    err = tol+1; % inicjalizujemy poczatkowa wartosc bledu
    n_wierszy=2; % zaczynamy ekstrapolacje od 2 wiersza
    while (err > tol || n_wierszy-1 <= Kmin) && n_wierszy-1 < Kmax+1
        % liczymy pierwsze wartosci nowego wiersza T(i,0)
        wiersz_dol = zeros(1,n_wierszy);    
        H = (b-a)/((M0+1)*2^(n_wierszy-1)); 
        wiersz_dol(1) = H*(sum(g(a+H:H:b-H))+(g(a)+g(b))/2);
        
        % ekstrapolujemy kolejne wartosci T(i,k)
        for k = 2:n_wierszy 
            wiersz_dol(k) = (4^(k-1)*wiersz_dol(k-1) ...
                -wiersz_gora(k-1))/(4^(k-1)-1);  
        end
        % liczymy blad i aktualizujemy wartosci algorytmu
        err = my_error(wiersz_gora(end),wiersz_dol(end));
        wiersz_gora = wiersz_dol;
        n_wierszy = 1 + n_wierszy;
    end
    Q = wiersz_dol(end); % najdokladniejsza wartosc to ostatnia z wiersza
    n_wierszy = n_wierszy-2; % ilosc ekstrapolacji to n_wierszy-2