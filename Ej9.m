clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS --- ECUACIONES");
disp("");
%
%Ejercicio 9
%
disp("Ejercicio 9.-");
function y=f(x)
  y=1-x+0.3*cos(x);
endfunction
function y=f1(x)
  y=-1-0.3*sin(x);
endfunction
function y=f2(x)
  y=-0.3*cos(x);
endfunction
%
%Apartado a
%
function x1=NR2(x0)
  c=f(x0); b=f1(x0); a=f2(x0)/2;
  d=sqrt(b^2-4*a*c);
  y1=(-b+d)/(2*a);
  y2=(-b-d)/(2*a);
  if abs(y1)<abs(y2)
    x1=x0+y1;
  else
    x1=x0+y2;
  endif
endfunction
%
%Apartado b
%
x0=1.5;
printf("  n          NR2       \n");
printf(" ---   ----------------\n");
printf(" %2d  %18.14f    \n",0,x0);
x1=x0;
n=0;
for n=1:6
  n++;
  x0=x1;
  x1=NR2(x0);
  printf(" %2d  %18.14f    \n",n,x1);
endfor
printf("==== FIN DEL EJERCICIO ====");