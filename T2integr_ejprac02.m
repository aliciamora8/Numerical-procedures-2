more off;
clc;
clear all;
disp("Ejercicio 2");
function y=f(x)
  y=1./(1+x.^2);
endfunction
a=-5; b=5;
exacto=quad(@f,a,b);
for i=1:6
  [nodos pesos]=integralNC2(a,b,i,true,true);
  aprox=pesos*f(nodos)';
  printf("%2d %14.10f %10.2e\n",i,aprox,aprox-exacto);
endfor
