clc
clear all
close all
%obliczenie czestotliwosci katowej
a = 0;
b = 50;
eps = 1e-12;
%metoda bisekcji
[xvect2, xdif2, fx2, it_cnt2] = bisect(a,b,eps,@compute_impedance);
fig = plot(xvect2);
title('Wykres przyblizonej wartosci x, od ilosci iteracji dla wzoru na impedancje');
xlabel('Liczba iteracji');
ylabel('Przyblizona wartosc x');
saveas(fig,'Wykres_x_od_iteracji_bisekcja_czestotliwosc.png');
fig1 = plot(xdif2);
title('Wykres zbieznosci, od ilosci iteracji dla wzoru na impedancje');
xlabel('Liczba iteracji');
ylabel('Wartosc przyblizenia');
saveas(fig1,'Wykres_zbieznosci_od_iteracji_bisekcja_czestotliwosc.png');
%metoda siecznych
[xvect3, xdif3, fx3, it_cnt3] = secant(a,b,eps,@compute_impedance);
fig2 = plot(xvect3);
title('Wykres przyblizonej wartosci x, od ilosci iteracji dla wzoru na impedancje');
xlabel('Liczba iteracji');
ylabel('Przyblizona wartosc x');
saveas(fig2,'Wykres_x_od_iteracji_sieczne_czestotliwosc.png');
fig3 = plot(xdif3);
title('Wykres zbieznosci, od ilosci iteracji dla wzoru na impedancje');
xlabel('Liczba iteracji');
ylabel('Wartosc przyblizenia');
saveas(fig3,'Wykres_zbieznosci_od_iteracji_sieczne_czestotliwosc.png');