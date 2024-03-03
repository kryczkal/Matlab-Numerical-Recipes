function Y = ipbval(X, wezly, wagi, wartosci)
    % Autor: Łukasz Kryczka
    % Funkcja licząca wartość wielomianu interpolacyjnego Lagrang'a w
    % postaci barycentrycznej dla wektora X
    
    gj = 0;
    gj_f_xj = 0;

    for j = 1:length(wagi)
        gj = gj + wagi(j) ./ (X-wezly(j));
        gj_f_xj = gj_f_xj + wagi(j) * wartosci(j) ./ (X-wezly(j));
    end
    Y = gj_f_xj ./ gj;

    % x rowne wezla zamieniamy na ich oryginalne wartosci 
    for i = find(ismember(X, wezly))
        Y(i) = wartosci(wezly == X(i));
    end
end