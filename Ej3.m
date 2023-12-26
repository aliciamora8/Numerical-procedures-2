clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 3
%
disp("Ejercicio 3.-");
%
%Apartado a
%
function y=g(x)
  y=-(x^3/9)-1;
endfunction
%
x0=-1.5;
%a es la sucesion de g1, b es la de Aitken y c la de Steffensen
a0=x0; a1=g(a0); a2=g(a1);
b0=a0-(a1^2-2*a0*a1+a0^2)/(a2-2*a1+a0);
c0 = b0;
disp('a) ACELERACIONES DE AITKEN Y STEFFENSEN');
disp('         g1              Aitken          Steffensen');
formato = '%18.14f';
printf([formato '\n'],a0);
printf([formato '\n'],a1);
printf([formato formato formato '\n'],a2,b0,c0);
for i=1:3
  for j=1:2
    a0=a1; a1=a2; a2=g(a1);
    b0=a0-(a1^2-2*a0*a1+a0^2)/(a2-2*a1+a0);
    printf([formato formato '\n'],a2,b0);
  endfor
  a0=a1; a1=a2; a2=g(a1);
  b0=a0-(a1^2-2*a0*a1+a0^2)/(a2-2*a1+a0);
  c1=g(c0); c2=g(c1);
  c0=c0-(c1^2-2*c0*c1+c0^2)/(c2-2*c1+c0);
  printf([formato formato formato '\n'],a2,b0,c0);
endfor
%
%Apartado b
%
function y=f(x)
  y=x.^3+10*x+9;
endfunction
%
disp("c) SUCESION DE STEFFENSEN");
x0=-1.5; e=1e-8;
do
  x1=f(x0); x2=f(x1);
  x0=x0-(x1^2-2*x0*x1+x0^2)/(x2-2*x1+x0);
  printf([formato '\n'],x0);
until abs(x1-x0)<e;
disp("==== FIN DEL EJERCICIO ====");