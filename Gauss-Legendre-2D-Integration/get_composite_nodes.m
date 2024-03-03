function composite_nodes = get_composite_nodes(a, b, n)
% get_composite_nodes oblicza wektor przeskalowanych węzłów dla 3-punktowej
% kwadratury Gaussa-Legendre'a dla złożonej kwadratury na przedziale [a, b]
%
% Wejście:
% a, b - granice przedziału całkowania, gdzie a < b, a i b rzeczywiste
% n    - liczba podprzedziałów, na które przedział [a, b] jest dzielony
%        liczba naturalna
%
% Wyjście:
% composite_nodes - macierz węzłów kwadratury Gaussa-Legendre'a
% Każda kolumna zawiera współczynniki dla odpowiedniego podprzedziału
%
% Opis:
% Funkcja get_composite_nodes działa przeskalowując i przesuwając 
% standardowe węzły kwadratury na każdy z n równych podprzedziałów 
% przedziału [a, b]. Wykorzystuje standardowe węzły 3-punktowej kwadratury 
% Gaussa-Legendre'a, skaluje je do rozmiaru każdego podprzedziału, 
% a następnie przesuwa do odpowiedniej lokalizacji.

single_nodes=[-7.7459666924148337704e-01;
               0.0000000000000000000e+00;
               7.7459666924148337704e-01];
interval = (b-a)/(n);
% Stworzenie wektora bazowego do skalowania i przesunięć
base = (a+interval/2):interval:b;
% Powielenie single_nodes, aby pasowały do długości base
nodes_replicated = repmat(single_nodes,1,length(base));
% Skalowanie i przesunięcie single_nodes
composite_nodes = (interval/2)*nodes_replicated+base;
end