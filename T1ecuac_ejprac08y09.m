clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 8 y 9
%
disp("Ejercicios 8 y 9.-");
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
function y=NR2(x)
  fu0=f(x); fu1=f1(x); fu2=f2(x);
  d=sqrt(fu1^2-2*fu0*fu2);
  h1=(-fu1+d)/fu2;
  h2=(-fu1-d)/fu2;
  if abs(h1)<abs(h2)
    y=x+h1;
  else
    y=x+h2;
  endif
endfunction
%
function y=Muller(x0,x1,x2)
  f0=f(x0); f1=f(x1); f2=f(x2);
  d0=(f1-f0)/(x1-x0); d1=(f2-f1)/(x2-x1);
  r0=(d1-d0)/(x2-x0);
  a=r0;
  b=d0-r0*(x0+x1);
  c=f0-x0*d0+x0*x1*r0;
  d=sqrt(b^2-4*a*c);
  y1=(-b+d)/(2*a);
  y2=(-b-d)/(2*a);
  if abs(y1-x2)<abs(y2-x2)
    y=y1;
  else
    y=y2;
  endif
endfunction
%
z0=1.5;
x0=1.3; x1=1.4; x2=1.5;


disp('  n       Muller             NR2');
disp('----------------------------------------');
formato='%18.14f';
printf(['%3d' formato '\n'],0,x0);
printf(['%3d' formato '\n'],1,x1);
printf(['%3d' formato formato '\n'],2,x2,z0);
for n=3:8
  x3=Muller(x0,x1,x2);
  z1=NR2(z0);
  printf(['%3d' formato formato '\n'],n,x3,z1);
  z0=z1;
  x0=x1; x1=x2; x2=x3;
endfor
disp("----------------------------------------");
disp("==== FIN DEL EJERCICIO ====");