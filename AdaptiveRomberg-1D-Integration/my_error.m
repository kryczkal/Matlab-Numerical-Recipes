function y =  my_error(wiersz_gora,wiersz_dol)
    y = abs(wiersz_gora-wiersz_dol)/max(1,abs(wiersz_dol));