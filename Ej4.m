clear all;
clc;
more off;
%
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 4
%
disp("Ejercicio 4.-");
%
%Apartado a
%
function y=f(x)
  y=(exp(-(x^2))+0.75*x)^3;
endfunction
%
tol=1e-6;
x0=-0.75;
x1=-0.76;
disp("a) METODO DE LA SECANTE");
x2=x1;
x1=x0;
n=1;
do
  n++;
  x0=x1; x1=x2;
  x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
until abs(x2-x1)<tol;
printf("En  %2d  iteraciones se obtuvo la aproximacion %18.14f\n",n,x2);
%
%Apartado b
%
tol=1e-6;
x0=-0.75;
x1=-0.76;
x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
disp("b) METODO SECANTE + AITKEN");
printf("%18.14f Semilla\n",x0);
printf("%18.14f Semilla\n",x1);
printf("%18.14f Secante\n",x2);
x3=x2;
xa=x1;
x2=x0;
do
  x0=x2; x1=xa; x2=x3;
  xa=x0-(x1^2-2*x1*x0+x0^2)/(x2-2*x1+x0);
  x2=(x2*f(xa)-xa*f(x2))/(f(xa)-f(x2));
  x3=(xa*f(x2)-x2*f(xa))/(f(x2)-f(xa));
  printf("%18.14f Aitken\n",xa);
  printf("%18.14f Secante\n",x2);
  printf("%18.14f Secante\n",x3);
until abs(xa-x3)<tol||abs(xa-x2)<tol||abs(x2-x3)<tol;
disp("==== FIN DEL EJERCICIO ====");