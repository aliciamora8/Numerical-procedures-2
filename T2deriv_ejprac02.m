clc;
more off;
clear all;
disp("Ejercicio 2.a)-");
a = -1;
k = 2;
nodos = [-2 -1 0 1];
n = length(nodos)-1;
printf("\nFormula para el calculo de la derivada\n");
printf("de f de orden k=%d en el punto a=%f\n",k,a);
printf("con nodos "); disp(nodos);
%preparacion de la matriz de Vandermonde
M = ones(n+1,n+1); %ya va la primera fila de 1 para evitar un posible 0^0
for i=1:n %restante matriz de Vandermonde (potencias 1 a n)
  M(i+1,:) = nodos.^i;
endfor
%terminos independientes
b = zeros(n+1,1);
b(k+1,1) = factorial(k); %para evitar un posible 0^0
for i=k+1:n
  b(i+1,1) = factorial(i)*a^(i-k)/factorial(i-k);
endfor
printf("Matriz de Vandermonde y términos independientes:\n");
disp([M b]);
alpha = M\b;
printf("Pesos:\n");
disp(alpha);

disp("");
disp("Ejercicio 2.b)-");
a = 1;
k = 1;
nodos = [-1 -1/2 0 1];
n = length(nodos)-1;
printf("\nFormula para el calculo de la derivada\n");
printf("de f de orden k=%d en el punto a=%f\n",k,a);
printf("con nodos "); disp(nodos);
%preparacion de la matriz de Vandermonde
M = ones(n+1,n+1); %ya va la primera fila de 1 para evitar un posible 0^0
for i=1:n %restante matriz de Vandermonde (potencias 1 a n)
  M(i+1,:) = nodos.^i;
endfor
%terminos independientes
b = zeros(n+1,1);
b(k+1,1) = factorial(k); %para evitar un posible 0^0
for i=k+1:n
  b(i+1,1) = factorial(i)*a^(i-k)/factorial(i-k);
endfor
printf("Matriz de Vandermonde y términos independientes:\n");
disp([M b]);
alpha = M\b;
printf("Pesos:\n");
disp(alpha);

disp("==========================================================");
disp("==== FIN DEL EJERCICIO ====");