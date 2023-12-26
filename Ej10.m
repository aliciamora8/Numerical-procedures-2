clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 10
%
disp("Ejercicio 10.-");
function y=f(x)
  y=exp(x/4)+cos(pi*x)-1.5;
endfunction
%
%Apartado a
%
function [s,n]=triseccion(a,b,e)
  fa=f(a); fb=f(b); n=0;
  do
    m1=(2*a+b)/3;
    m2=(a+2*b)/3;
    fm1=f(m1); fm2=f(m2);
    if fm1*fa<0
      b=m1; fb=fm1;
    else
      if fm2*fm1<0
        a=m1; fa=fm1;
        b=m2; fb=fm2;
      else
        a=m2; fa=fm2;
      endif
    endif
    n++;
  until (b-a)/2<e;
  s=(a+b)/2;
endfunction
%
%Apartado b
%
x=linspace(0,6,100);
plot([0,6],[0,0],'k', x,f(x),'m');
%
%Apartado c
%
printf(" Iter       Aproximacion   \n");
disp(" ----    ------------------");
for n=0:3
  a=n; b=n+1;
  [s,n]=triseccion(a,b,1e-8);
  printf("  %2d    %18.14f\n",n,s);
endfor
disp("==== FIN DEL EJERCICIO ====");