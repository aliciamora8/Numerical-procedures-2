#ITRODUCCIÓN
clear all; %borrado general
clc; %limpieza de pantalla
more off; %sin interrupciones en pantalla
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp("");
%
%Ejercicio 1
%
disp("Ejercicio 1.-");


#PARA ESCRIBIR
disp("");  %esto es una línea en blanco de separación
printf("%2d %10.6f %10.6f %10.6f %10.2e\n",n,a,b,m,fm); %sirve para sacar datos, \n salto de línea
%tambien se puede poner:
formato='%18.14f';
printf('%3d' formato '\n',0,x0);
'%s' %para texto


#FUNCIONES Y OPERACIONES
function y=f(x)
  y=0;
endfunction
  .*  %multiplica componente a componente
  .^  %eleva componente a componente
  exp(x)  %e^x
  < = >
  1e-6  %1^-6
  abs(x)  %valor absoluto
  || %es "or"
  sin(x)  %seno
  cos(x)  %coseno
  A\x %resuelve el sistema
  norm(x,1) %norma 1 de x
  norm(x,"inf") %norma infinito de x
  sqrt(x) %raiz cuadrada
  pi  %numero pi
  
  
#MATRICES
M=[1 2; 3 4];


#LISTA
[0 1 2 3 4]
  
  
#FUNCIONES FUERA DEL PROGRAMA
%Para la función aparte, empezar siempre con function [x1,n,msg]=nombredelafuncion(f,f1,x0,e,nmax) y el nombre de la funcion=nombre del archivo
%Dentro del programa se pone:
[m n msg]=nombredelafuncion(@f,@f1,s,1e-8,50);  %[] son para sacar varios datos, 
                                                %@ no altera la función fuera solo mete una copia de ella (poner siempre que se trate de una función)
  
#GRÁFICAS Y COLORES
figure(1);
x=linspace(0,100,200); %linspace(principio,final,cantidad) que genera 200 puntos entre 0 y 100
plot([-3 0],[-3 0],'k', x,x-f(x),'k', x,g1(x),'r;g1;'); %dibujar lineas
  'k' %negro
  'b' %azul
  'r' %rojo
  'm' %magenta
  'c' %cian
  'g' %verde
  'y' %amarillo
  'w' %blanco
  'k;g1;' %color con leyenda
  '*r'  %estrellita roja
  'om'  %circulito magenta
  '+k'  %cruz negra
  '.b'  %punto azul
  '^c'  %triangulito mirando hacia arriba cian
  'sw'  %cuadradito blanco
axis([-3 0 -3 0]); %x min x max y min y max  


#BUCLES
do
until
%
if
else
endif
%
return; %se usa dentro de los bucles y sirve para forzar el corte del bucle
%
for i=2:length(n) %desde i=2 hasta i=longitud de n (que posiblemente sea una lista)
endfor
%
abs(x1-x0)/abs(x1)<=tol %criterio relativo de parada

#OTROS
int2str(n) %cadena de caracteres, convierte caracteres en una lista


#FIN
disp("==== FIN DEL EJERCICIO ====");