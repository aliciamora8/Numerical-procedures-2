more off;
clc;
clear all;
disp("Ejercicio 4");
%Apartado a
a=1.5;
k=2;
function alpha=pesosderiv(a,k,nodos)
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
function y=f(x)
  y=sqrt(1./(1+x.^2));
endfunction
function y=f2(x)
  y=(2*x.^2-1)./((x^2+1)^(5/2));
endfunction
h=[0.1 0.01 0.001];
disp(" h      aproximacion        error");
disp("=======================================");
for i=1:3
  hi=h(i);
  nodos=[a-hi a+hi a+2*hi a+4*hi];
  pesos=pesosderiv(a,k,nodos);
  aprox=pesos'*f(nodos)';
  error=f2(a)-aprox;
  printf('%3.3f %10.14f %10.14f\n',hi,aprox,error);
endfor

%Apartado b
a=0;
c=4;
function alpha=pesosintegr(a,c,nodos)
  n=length(nodos)-1;
  M=ones(n+1,n+1);
  for i=1:n
    M(i+1,:)=nodos.^i;
  endfor
  b=zeros(n+1,1);
  for i=1:n+1
    b(i,1)=(c^i-a^i)/i;
  endfor
  alpha=M\b;
endfunction
function y=g(x)
  y=x.*exp(-x./2) - cos(x.*pi);
endfunction
exacto=quad(@g,a,c);
h=[2 4/3 1 0.5];
disp(" h      aproximacion        error");
disp("=======================================");
for i=1:4
  hi=h(i);
  nodos=[0 hi 2*hi];
  pesos=pesosintegr(a,c,nodos);
  aprox=pesos'*g(nodos)';
  error=exacto-aprox;
  printf('%3.3f %10.14f %10.14f\n',hi,aprox,error);
endfor
  