clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio2
%
disp("Ejercicio 2.-");
%
function y=f(x)
  y=x.^3+9*x+9;
endfunction
function y=g1(x)
  y=-(x.^3)/9-1;
endfunction
function y=g2(x)
  y=-9./(x.^2+9);
endfunction
function y=g3(x)
  y=x.^3+10*x+9;
endfunction
function y=g4(x)
  y=(2*(x.^3)-9)./(3*(x.^2+3));
endfunction
%
%Apartado a
%
x=linspace(-3,0,50);
plot([-3 0],[-3 0],'k', 
  x,x-f(x),'b', 
  x,g1(x),'r;g1;', 
  x,g2(x),'g;g2;', 
  x,g3(x),'c;g3;',
  x,g4(x),'m;g4;');
axis([-3 0 -3 0]);
disp("a) Graficamente vemos que asi ocurre");
%
%Apartado b
%
n=0;
x0=x2=x4=x6=-1.5;
x1=x0;
x3=x2;
x5=x4;
x7=x6;
do
  n++;
  x0=x1;
  x1=g1(x0);
  x2=x3;
  x3=g2(x2);
  x4=x5;
  x5=g3(x4);
  x6=x7;
  x7=g4(x6);
  printf("%10.6f   %10.6f   %10.2e   %10.6f\n",x1,x3,x5,x7);
until n>11;