clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 5
%
disp("Ejercicio 5.-");
function y=f(x)
  y=x.^3+9*x+9;
endfunction
function y=f1(x)
  y=3*x.^2+9;
endfunction
%
semillas=linspace(-3,0,11);
%
disp("Metodo de Newton-Raphson");
disp("     Semilla      Aproximacion  Inter    Mensaje");
disp("   -----------    ------------  -----   --------");
for s=semillas
  [m n msg]=fNewtonRaphson(@f,@f1,s,1e-8,50); %@trabaja con una copia de esos valores y no los altera fuera de la funcion, para las funciones siempre se pone; 1e-8 tolerancia 50 numero iteraciones
  printf("%14.8f %14.8f   %3d     %s\n",s,m,n,msg);
endfor
disp("==== FIN DEL EJERCICIO ====");