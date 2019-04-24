## Copyright (C) 2019 Piotr
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} lab5_zad1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Piotr <Piotr@DESKTOP-VJBPF14>
## Created: 2019-04-23

clc
clear all
close all

##ZADANIE 1

[XX,YY]=meshgrid(linspace(0,100,101),linspace(0,100,101));

[x,y,f]=lazik(33);
##[x,y,f]=lazik(15);
#[x,y,f]=lazik(25);
##[x,y,f]=lazik(33);

[p_poly] = polyfit2d(x,y,f);
[FF_poly] = polyval2d(XX,YY,p_poly);

[p_tryg] = trygfit2d(x,y,f);
[FF_tryg] = trygval2d(XX,YY,p_tryg);

subplot(2, 2,1)
h = plot(x,y,'-o','linewidth',3)
title('\fontsize{16}Tor ruchu lazika (dla K=33)')
xlabel('x[m]','FontSize',17)
xticks(0:10:100)
ylabel('y[m]','FontSize',17)
yticks(0:10:100)
grid on

subplot(2,2,2)
plot3(x,y,f,'o')
title('\fontsize{16}Zebrane wartosci probek (1089 probek)')
xlabel('x[m]','FontSize',17)
ylabel('y[m]','FontSize',17)
zlabel('f(x,y)','FontSize',17)
zticks(0:2:20)
grid on

subplot(2,2,3)
surf(XX,YY,FF_poly)
title('\fontsize{16}Interpolacja wielomianowa')
xlabel('x[m]','FontSize',17)
ylabel('y[m]','FontSize',17)
zlabel('f(x,y)','FontSize',17)
zticks(0:5:20)
grid on

subplot(2,2,4)
surf(XX,YY,FF_tryg)
title('\fontsize{16}Interpolacja tygonometryczna')
xlabel('x[m]','FontSize',17)
ylabel('y[m]','FontSize',17)
zlabel('f(x,y)','FontSize',17)
zticks(0:2:20)
grid on


##ZADANIE 2

clc
clear all
close all

[XX,YY]=meshgrid(linspace(0,100,101),linspace(0,100,101));

Div_poly = [];
[x_before,y_before,f_before] = lazik(4);
[p_poly_before] = polyfit2d(x_before,y_before,f_before);
[FF_poly_before] = polyval2d(XX,YY,p_poly_before);
for i=5:45
  [x,y,f] = lazik(i);

  [p_poly] = polyfit2d(x,y,f);
  [FF_poly] = polyval2d(XX,YY,p_poly);
    
  Div_poly(i) = max(max(FF_poly - FF_poly_before));
  FF_poly_before = FF_poly;
end 

semilogy(Div_poly)
grid on
xticks(0:5:50)
ylabel('maksymalna wartosc roznicy interpolowanych funkcji', 'Fontsize',13)
xlabel('liczba punktow pomiarowych wzdluz jednego kierunku', 'Fontsize',13)
title('Roznica interpolowanych funkcji dla interpolacji wielomianowej', 'Fontsize', 13)

Div_tryg = [];
[x_before,y_before,f_before] = lazik(4);
[p_tryg_before] = trygfit2d(x_before,y_before,f_before);
[FF_tryg_before] = trygval2d(XX,YY,p_tryg_before);
for i=5:45
  [x,y,f] = lazik(i);

  [p_tryg] = trygfit2d(x,y,f);
  [FF_tryg] = trygval2d(XX,YY,p_tryg);
    
  Div_tryg(i) = max(max(FF_tryg - FF_tryg_before));
  FF_tryg_before = FF_tryg;
end 

plot(Div_tryg)
grid on
xticks(0:5:50)
ylabel('maksymalna wartosc roznicy interpolowanych funkcji', 'Fontsize',13)
xlabel('liczba punktow pomiarowych wzdluz jednego kierunku', 'Fontsize',13)
title('Roznica interpolowanych funkcji dla interpolacji trygonometrycznej', 'Fontsize', 13)

