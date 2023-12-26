clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 10
%
disp("Ejercicio 10.-");
%
function y=f(x)
  y=exp(x/4)+cos(pi*x)-1.5;
endfunction
%
function [m n nf]=triseccion(a,b,e)
  fa=f(a); fb=f(b);
  n=0; nf=2;
  do
    n++;
    m1=(2*a+b)/3;
    m2=(a+2*b)/3;
    fm1=f(m1); nf++;
    if fa*fm1<0 %tercio izquierdo
      b=m1; fb=fm1;
    else 
      fm2=f(m2); nf++;
      if fm2*fb<0 %tercio derecho
        a=m2; fa=fm2;
      else %tercio central
        a=m1; fa=fm1;
        b=m2; fb=fm2;
      endif
    endif
  until b-a<=2*e;
  m=(a+b)/2;
endfunction
%
%grafica [0,100]
figure(1);
x=linspace(0,6,100);
y=f(x);
plot(x,y,[0 6],[0 0], 'k');
%
nodos=[0 1 2 3 4];
for i=2:length(nodos)
  [m n nf] = triseccion(nodos(i-1),nodos(i),1e-8);
  printf("Raiz %14.8f en %d iteraciones con %d evaluaciones\n",m,n,nf);
endfor
% en todos sale 17 iteraciones ya que todos tienen la misma longitud de intervalo y la misma cota
disp("======== FIN DEL EJERCICIO ========");