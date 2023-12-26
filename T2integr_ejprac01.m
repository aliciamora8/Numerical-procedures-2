more off;
clc;
clear all;
disp("Ejercicio 1");
function y = f(x)
  y = exp(-x.^2/3);
endfunction
a=0; b=4;
exacto=quad(@f,a,b);
disp("a) Abierta con cuatro nodos");
[nodos pesos]=integralNC(a,b,4,false,false);
aprox=pesos'*f(nodos)';
printf("Nodos: "); disp(nodos);
printf("Pesos: "); disp(pesos');
printf("Aprox: %14.10f error: %10.2e\n\n",aprox,aprox-exacto);

disp("b) Cerrada con cuatro nodos");
[nodos pesos]=integralNC(a,b,2,true,true);
aprox=pesos'*f(nodos)';
printf("Nodos: "); disp(nodos);
printf("Pesos: "); disp(pesos');
printf("Aprox: %14.10f error: %10.2e\n\n",aprox,aprox-exacto);

disp("c) Abierta izda, cerrada dcha con cuatro nodos");
[nodos pesos]=integralNC(a,b,3,false,true);
aprox=pesos'*f(nodos)';
printf("Nodos: "); disp(nodos);
printf("Pesos: "); disp(pesos');
printf("Aprox: %14.10f error: %10.2e\n\n",aprox,aprox-exacto);

disp("d) Cerrada izda, abierta dcha con cuatro nodos");
[nodos pesos]=integralNC(a,b,3,true,false);
aprox=pesos'*f(nodos)';
printf("Nodos: "); disp(nodos);
printf("Pesos: "); disp(pesos');
printf("Aprox: %14.10f error: %10.2e\n\n",aprox,aprox-exacto);