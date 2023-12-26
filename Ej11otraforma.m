clear all; 
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 11
%
function y=f(x)
  y=[sin(x(1)*x(2))/2-x(2)/(4*pi)-x(1)/2;
  (1-1/(4*pi))*(exp(2*x(1))-e)+e/pi*x(2)-2*e*x(1)];
endfunction
function M=J(x)
  M=[cos(x(1)*x(2))*x(2)/2-1/2, cos(x(1)*x(2))*x(1)/2-1/(4*pi);
  (1-1/(4*pi))*exp(2*x(1))*2-2*e, e/pi];
endfunction
%
semillas=[-2 -2; -1 -1; 0 0; 1 1; 2 2];
tol=1e-8;
for s=1:rows(semillas)
  x0=semillas(s,:)';
  n=0;
  printf("Con la semilla x=%d y=%d ",x0');
  x1=x0;
  do
    n++;
    x0=x1;
    x1=x0-J(x0)\f(x0);
  until norm(x1-x0,"inf")/norm(x1,"inf")<tol;
  printf("se obtuvo en %2d iteraciones la aproximacion x=%18.14f y=%18.14f\n",n,x1);
endfor
printf("==== FIN DEL EJERCICIO ====");