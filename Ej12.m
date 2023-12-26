clear all;
clc;
more off;
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 12
%
disp("Ejercicio 12.-");
function y=F(x)
  y=x+0.999*sin(x);
endfunction
function y=F1(x)
  y=1+0.999*cos(x);
endfunction
%
x0=13;
x1=x0;
for n=1:200
  x0=x1;
  x1=x0-F(x0)/F1(x0);
  if n==50||n==100||n==150||n==200
    printf("En la iteracion %3d obtenemos la aproximacion %18.14f\n",n,x1);
  endif
endfor
disp("");
%
function y=G(x,t)
  y=t*F(x)+(1-t)*(F(x)-F(13));
endfunction
function y=G1(x,t)
  y=t*F1(x)+(1-t)*F1(x);
endfunction
%
particiones=linspace(0,1,100);
x1=0;
n=0;
for p=particiones
  n++;
  for i=1:2
    x0=x1;
    x1=x0-G(x0,p)/G1(x0,p);
  endfor
  if n==10||n==20||n==30||n==40||n==50||n==60||n==70||n==80||n==90
    printf("La solucion apoximada s_%2d es %18.14f\n",n,x1);
  endif
endfor
x0=x1;
x1=x0-G(x0,1)/G1(x0,1);
printf("La solucion apoximada s_100 es %18.14f\n",x1);
printf("==== FIN DEL EJERCICIO ====");