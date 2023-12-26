clear all;
clc;
more off;
%
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 5
%
disp("Ejercicio 5.-");
function y=f(x)
  y=x^3+9*x+9;
endfunction
%
function y=f1(x)
  y=3*x^2+9;
endfunction
%
tol=1e-8;
nmax=50;
semillas=linspace(-3,0,11);
disp("Metodo de Newton-Raphson");
disp("     Semilla      Aproximacion  Iter    Mensaje");
disp("   -----------    ------------  -----   --------");
for s=semillas
  [xs,n,msg]=fNewtonRaphson2(@f,@f1,s,tol,nmax);
  printf("%18.14f  %18.14f  %2d  %s\n",s,xs,n,msg);
endfor