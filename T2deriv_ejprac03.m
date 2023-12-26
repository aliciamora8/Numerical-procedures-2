clc;
more off;
clear all;
disp("Ejercicio 3");
function alpha=pesosderiv(k,a,nodos)
  n=length(nodos)-1;
  M=ones(n+1,n+1);
  for i=1:n
    M(i+1,:)=nodos.^i;
  endfor
  b=zeros(n+1,1);
  b(k+1,1)=factorial(k);
  for i=k+1:n
    b(i+1,1)=factorial(i)*a^(i-k)/factorial(i-k);
  endfor
  alpha=M\b;
endfunction
%prueba
a=0;
k=3;
nodos=[-0.5 0.5 1 1.5 2];
alpha=pesosderiv(k,a,nodos);
disp("Pesos:");
disp(alpha);