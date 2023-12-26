clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 7
%
disp("Ejercicio 7.-");
function y=f(x)
  y=[4*x(1)^2+x(2)^2-4; x(1)+x(2)-sin(x(1)-x(2))];
endfunction
function M=J(x)
  M=[8*x(1) 2*x(2); 1-cos(x(1)-x(2)) 1+cos(x(1)-x(2))];
endfunction
%
x0=[0.5;0.5];
tol=1e-8;
disp('METODO DE NEWTON-RAPHSON PARA SISTEMAS');
x1=x0;
n=0;
do
  n++;
  x0=x1;
  x1=x0-J(x0)\f(x0);
until norm(x1-x0,1)<tol;
printf("La solucion aproximada x=%18.16f y=%18.16f se ha obtenido en %2d iteraciones\n",x1,n);
disp("==== FIN DEL EJERCICIO ====");