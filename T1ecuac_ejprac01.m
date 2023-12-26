#hola
%hola
clear all; %borrado general
clc; %limpieza de pantalla
more off; %sin interrupciones en pantalla
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp(""); %esto es una linea en blanco de separacion
%
%Ejercicio 1
%
%colocar esto de arriba en cada ejercicio a entregar
disp("Ejercicio 1.-");
function y=f(x)
  y=x.*exp(-x/3)-0.5; %.* multiplica componente a componente
endfunction
function y=f1(x) %la derivada
  y=(1-x/3)*exp(-x/3);
endfunction
%
%grafica en [0,100]
figure(1);
x=linspace(0,100,200); %linspace(principio,final,cantidad) que genera 200 puntos entre 0 y 100
plot(x,f(x),[0 100],[0 0],'k'); %dibujar el eje de ordenadas de 0 a 100 a la altura 0 y 'k' color negro
%
%grafica en [0,10]
figure(2);
x=linspace(0,10,50);
plot(x,f(x),[0 10],[0 0],'k');
%
disp("1.a) De las dos figuras se deduce que hay dos raices positivas");
disp("1.b) La mayor esta en el intervalo [7,10] de amplitud 3");
%
disp("1.c) METODO DE BISECCION");
a=7; b=10; e=0.05;
fa=f(a); fb=f(b);
n=0;
disp("==============================================");
disp(" n      a          b          m         f(m)");
disp("--- ---------  ---------  ---------  ---------");
disp("==============================================");
do
  n++; %contador de iteraciones
  m=(a+b)/2; fm=f(m); %se evalua f una sola vez
  printf("%2d %10.6f %10.6f %10.6f %10.2e\n",n,a,b,m,fm); %10.6 significa que hay lugar para 10 cifras, y 6 de ellas serán decimales. %d será notacion decimal, %f notacion normal de coma fija, y %e de forma exponencial. \n es cambio de linea
  if fa*fm<0
    b=m; fb=fm;
  else 
    a=m; fa=fm;
  endif
until b-a<= e;
%
disp("1.d) METODO DE NEWTON-RAPHSON");
x0=m; tol=1e-6; %tolerancia
x1=x0;
do
  x0=x1;
  x1=x0-f(x0)/f1(x0);
until abs(x1-x0)/abs(x0)<tol;
disp("Las dos ultimas aproximaciones obtenidas:");
printf("%14.10f y %14.10f\n",x0,x1);
disp("==== FIN DEL EJERCICIO ====");