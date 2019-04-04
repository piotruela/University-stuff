%obliczenie czasu 
a = 0;
b = 50;
eps = 1e-12;
%metoda bisekcji
[xvect4, xdif4, fx4, it_cnt4] = bisect(a,b,eps,@compute_velocity);
fig = plot(xvect4);
title('Wykres przyblizonej wartosci x, od ilosci iteracji dla wzoru na predkosc');
xlabel('Liczba iteracji');
ylabel('Przyblizona wartosc x');
saveas(fig,'Wykres_x_od_iteracji_bisekcja_predkosc.png');
fig1 = plot(xdif4);
title('Wykres zbieznosci, od ilosci iteracji dla wzoru na predkosc');
xlabel('Liczba iteracji');
ylabel('Wartosc przyblizenia');
saveas(fig1,'Wykres_zbieznosci_od_iteracji_bisekcja_predkosc.png');
%metoda siecznych
[xvect5, xdif5, fx5, it_cnt5] = secant(a,b,eps,@compute_velocity);
fig2 = plot(xvect5);
title('Wykres przyblizonej wartosci x, od ilosci iteracji dla wzoru na predkosc');
xlabel('Liczba iteracji');
ylabel('Przyblizona wartosc x');
saveas(fig2,'Wykres_x_od_iteracji_sieczne_predkosc.png');
fig3 = plot(xdif5);
title('Wykres zbieznosci, od ilosci iteracji dla wzoru na predkosc');
xlabel('Liczba iteracji');
ylabel('Wartosc przyblizenia');
saveas(fig3,'Wykres_zbieznosci_od_iteracji_sieczne_predkosc.png');