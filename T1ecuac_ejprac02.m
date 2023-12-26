clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 2
%
disp("Ejercicio 2.-");
function y=f(x)
  y=x.^3+9*x+9;
endfunction
function y=g1(x)
  y=-x.^3/9-1;
endfunction
function y=g2(x)
  y=-9./(x.^2+9);
endfunction
function y=g3(x)
  y=x.^3+10*x+9;
endfunction
function y=g4(x)
  y=(2*x.^3-9)./(3*(x.^2+3));
endfunction
%
%Apartado a
%
figure(1); %superposicion de las cuatro funciones de iteracion
x=linspace(-3,0,50);
plot([-3 0],[-3 0],'k',
    x,x-f(x),'k',
    x,g1(x),'r;g1;',
    x,g2(x),'b;g2;',
    x,g3(x),'m;g3;',
    x,g4(x),'c;g4;'); %diagonal. x,x-f(x) es abscisa y ordenada. r;g1 rojo con leyenda. m magenta. c cian
axis([-3 0 -3 0]); %x min x max y min y max
disp("a) Graficamente observamos que todas las funciones de iteración cortan a la funcion h(x)=x en el mismo punto, por lo que tienen el mismo punto fijo. La función x-f(x) tambien la corta en el mismo punto, por lo que tendrá un punto fijo x-f(x)=x, y entonces, f(x)=0");
%
%Apartado b
%
disp("b) Las 10 primeras iteraciones generadas por cada metodo:");
n=0;
x1=x2=x3=x4=-1.5;
disp("==============================================");
disp(" n      g1         g2         g3         g4");
disp("--- ---------  ---------  ---------  ---------");
disp("==============================================");
do
  n++;
  y1=g1(x1);
  y2=g2(x2);
  y3=g3(x3);
  y4=g4(x4);
  printf("%2d %10.6f %10.6f %10.2e %10.6f\n",n,y1,y2,y3,y4);
  x1=y1;
  x2=y2;
  x3=y3;
  x4=y4;
until n>=10;
%
%Apartado c
%
%para el metodo g1
n1=0;
x1=-1.5;
do
  n1++;
  y1=g1(x1);
  f1=f(x1);
  if abs(y1-x1)<=abs(f1)
    e=abs(f1);
  else 
    e=abs(y1-x1);
  endif
  x1=y1;
until e<=10e-7;
%para el metodo g2
n2=0;
x1=-1.5;
do
  n2++;
  y1=g2(x1);
  f1=f(x1);
  if abs(y1-x1)<=abs(f1)
    e=abs(f1);
  else 
    e=abs(y1-x1);
  endif
  x1=y1;
until e<=10e-7;
%para el metodo g4
n4=0;
x1=-1.5;
do
  n4++;
  y1=g4(x1);
  f1=f(x1);
  if abs(y1-x1)<=abs(f1)
    e=abs(f1);
  else 
    e=abs(y1-x1);
  endif
  x1=y1;
until e<=10e-7;
disp("c) El numero de iteraciones necesatias para una tolerancia de 10e-7 en cada metodo sera:");
printf("g1: %2d,  g2: %2d,  g4:%2d.\n",n1,n2,n4);
disp("==== FIN DEL EJERCICIO ====");