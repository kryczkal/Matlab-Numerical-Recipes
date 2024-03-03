function wykwi(g,a,b,n)
    % Autor: Łukasz Kryczka
    % Funckja generująca wykresy dla wskaźnika na funkcję g, na przedziale
    % od a do b, dla n+1 węzłów.

    % wygenerowanie wezlow czebyszewa na przedziale od a do b
    i = 0:n;
    wezly = (a + b) / 2 - ( (b-a)/2 ) .* cos( (2 .* i + 1)...
        .* pi ./ (2 * n + 2) );
    X = linspace(a,b,2000000);

    % wykres funkcji
    plot(X, g(X), color="b")
    hold on
    % wykres interpolacji funkcji
    plot(X, ipbval(X, wezly, baryc(wezly), g(wezly) ), color="r");
    % wezly zaznaczone na zielono
    scatter(wezly, g(wezly), 'filled', 'green')
    hold off
end