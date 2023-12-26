clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 6
%
disp("Ejercicio 6.-");
function y=f(x)
  y=x.^3+9*x+9;
endfunction
%
semillas=linspace(-3,0,11);
%
disp("Metodo de la Secante");
disp("    Semilla 1        Semilla 2       Aproximacion    Inter    Mensaje");
disp("   -----------      -----------      ------------    -----   ---------");
for s1=semillas
  s2=s1+0.01;
  [m n msg]=fSecante(@f,s1,s2,1e-8,50);
  printf("%14.8f   %14.8f   %14.8f     %3d      %s\n",s1,s2,m,n,msg);
endfor
disp("==== FIN DEL EJERCICIO ====");