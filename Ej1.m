clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 1
%
disp("Ejercicio 1.-");
%
function y=f(x)
  y=x.*exp(-x/3)-0.5;
endfunction
%
figure(1);
x=linspace(0,10,200);
plot([0 10],[0 0],'k', x,f(x),'b');
%
disp("a) Por la grafica deducimos que hay dos raices reales en [0,10].");
disp("b) Un intervalo que contiene a la solucion mayor seria [7,10] de amplitud 3");
disp("c) METODO DE BISECCION");
disp("================================================");
disp("     a            b             m         f(m)  ");
disp("  --------    ---------     --------   ---------");
disp("================================================");
n=0;
a=7;
b=10;
e1=0.05;
fa=f(a);
fb=f(b);
do
  n++;
  m=(a+b)/2;
  fm=f(m);
  printf("%10.6f   %10.6f   %10.6f  %10.2e\n",a,b,m,fm);
  if fa*fm<0
    b=m;
  else
    a=m;
    fa=fm;
  endif
until (b-a)/2^(n+1)<=e1;
%
disp("d) METODO NEWTON-RAPHSON");
function y=f1(x)
  y=exp(-x/3)-x/3.*exp(-x/3);
endfunction
%
x0=m;
x1=x0;
e2=1e-6;
do
  x0=x1;
  x1=x0-f(x0)/f1(x0);
until abs(x1-x0)/abs(x0)<e2;
printf("Las dos ultimas aproximaciones son: %20.16f y %20.16f\n",x0,x1);
disp("==== FIN DEL EJERCICIO ====");