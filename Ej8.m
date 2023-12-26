clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 8
%
function y=f(x)
  y=1-x+0.3*cos(x);
endfunction
%
%Apartado a
%
function x3=Muller(x0,x1,x2)
  f0=f(x0); f1=f(x1); f2=f(x2);
  d0=(f1-f0)/(x1-x0);
  d1=(f2-f1)/(x2-x1);
  a=(d1-d0)/(x2-x0);
  b=d0-a*(x0+x1);
  c=f0-x0*d0+a*x0*x1;
  d=sqrt(b^2-4*a*c);
  y1=(-b+d)/(2*a);
  y2=(-b-d)/(2*a);
  if abs(y1-x2)<abs(y2-x2)
    x3=y1;
  else
    x3=y2;
  endif
endfunction
%
%Apartado b
%
x0=1.3; x1=1.4; x2=1.5;
printf("  n      Muller   \n");
printf(" ---    --------  \n");
printf(" %2d    %18.16f\n",0,x0);
printf(" %2d    %18.16f\n",1,x1);
printf(" %2d    %18.16f\n",2,x2);
x3=x2;
x2=x1;
x1=x0;
for n=3:8
  x0=x1; x1=x2; x2=x3;
  x3=Muller(x0,x1,x2);
  printf(" %2d    %18.16f\n",n,x3);
endfor
disp("==== FIN DEL EJERCICIO ====");