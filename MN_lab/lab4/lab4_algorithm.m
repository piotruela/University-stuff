clc
clear all
close all
%obliczenie liczby zmiennych
%approx uzywany jest do rysowania wykresu
a = 1;   
b = 6e+4;
eps = 1e-3;
%metoda bisekcji
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_time);
fig = plot(xvect);
title('Wykres przyblizonej wartosci x, od ilosci iteracji dla wzoru na czas algorytmu');
xlabel('Liczba iteracji');
ylabel('Przyblizona wartosc x');
saveas(fig,'Wykres_x_od_iteracji_bisekcja_algorytm.png');
fig1 = plot(xdif);
title('Wykres zbieznosci, od ilosci iteracji dla wzoru na czas algorytmu');
xlabel('Liczba iteracji');
ylabel('Wartosc przyblizenia');
saveas(fig1,'Wykres_zbieznosci_od_iteracji_bisekcja_algorytm.png');
%metoda siecznych
[xvect1, xdif1, fx1, it_cnt1] = secant(a,b,eps,@compute_time);
fig2 = plot(xvect1);
title('Wykres przyblizonej wartosci x, od ilosci iteracji dla wzoru na czas algorytmu');
xlabel('Liczba iteracji');
ylabel('Przyblizona wartosc x');
saveas(fig2,'Wykres_x_od_iteracji_sieczne_algorytm.png');
fig3 = plot(xdif1);
title('Wykres zbieznosci, od ilosci iteracji dla wzoru na czas algorytmu');
xlabel('Liczba iteracji');
ylabel('Wartosc przyblizenia');
saveas(fig3,'Wykres_zbieznosci_od_iteracji_sieczne_algorytm.png');