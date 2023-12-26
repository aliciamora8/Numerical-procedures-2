%CÓDIGOS
Clear all;
clc;
more off;
% Formulas compuestas contando numero intervalos hasta cierta tolerancia
% por ejemplo:
tol=1e-5;
a=0;
b=5;
x=3;
function y=f(x);
  y=x.*exp(x);
endfunction
exacto=quad(@f,a,b);

% Newton cotes abierta x nodos
n=0;
do
  n++;
  h=(b-a)/n;
  s=0;
  for i=1:n
    [nodos pesos]=integralNC(a,b,x+1,false,false);
    s=s+ pesos*(f(nodos))';
  endfor
  error=s-exacto;
until abs(error)<tol;

% Newton Cotes cerrada x nodos
n=0;
do
  n++;
  h=(b-a)/n;
  s=0;
  for i=1:n
    [nodos pesos]=integralnc(a,b,x-1,true,true);
    s=s+ pesos*(f(nodos))';
  endfor
  error=s-exacto;
until abs(error)<tol;

% Rectangulo izquierda
n=0;
do
  n++;
  h=(b-a)/n;
  s=0;
  for i=0:n-1
    s=s+h*f(a+i*h);
  endfor
  error=s-exacto;
until abs(error)<tol;

% Rectangulo derecha
n=0;
do
  n++;
  h=(b-a)/n;
  s=0;
  for i=1:n
    s=s+h*f(a+i*h);
  endfor
  error=s-exacto;
until abs(error)<tol;

% Punto medio
n=0;
do
  n++;
  h=(b-a)/n;
  s=0;
  for i=1:n
    s=s+h*f(a+(i-1/2)*h);
  endfor
  error=s-exacto;
until abs(error)<tol;

% Trapecio
n=0;
do
  n++;
  h=(b-a)/n;
  s2=sum(f(linspace(a+h,b-h,n-1)));
  s=h/2*(f(a)+f(b)+2*s2);
  error=s-exacto;
until abs(error)<tol;

% Simpson
n=0;
do
  n+=2;
  h=(b-a)/n;
  s4=sum(f(linspace(a+h,b-h,n/2)));
  s2=sum(f(linspace(a+2*h,b-2*h,n/2-1)));
  s=h/3*(f(a)+f(b)+4*s4+2*s2);
  error=s-exacto;
until abs(error)<tol;
%



%Código para escribir la tabla de Romberg
%Tabla de Romberg

function N = tablaRomberg(a,b,M,tol)
  printf("N  Inter  Aprox     Criterio\n");
  printf("-- ---- ---------- ---------\n");
  N = 1; n = 1; h = b-a;
  R(1,1) = h/2*(f(a)+f(b));
  printf("%d %3d %12.8f\n",0,1,R(1,1));
  do
    x = linspace(a+h/2,b-h/2,n);
    R(N+1,1) = 1/2*(R(N,1)+h*sum(f(x)));
    N++; n = 2*n; h = h/2;
    for k=2:N
      coef = 4^(k-1);%no deberia estar elevado a k?
      R(N,k) = (coef*R(N,k-1)-R(N-1,k-1))/(coef-1);
    endfor
    printf("%d %3d %12.8f %9.2e\n",N,2^N,R(N,N),abs(R(N-1,N-1)-R(N,N)));
  until abs(R(N-1,N-1)-R(N,N)) < tol || N >= M;
  printf("-- ---- ---------- ---------\n");
endfunction
%

%Funcion para usar Newton-Cotes cerrada o abierta
%funcion integralNC


function [nodos pesos]=integralNC(a,b,n,izq,dcha)
  nodos=linspace(a,b,n+1); %longitud del vector nodos
  if !dcha %=>derecha abto
    nodos(n+1)=[]; %si el comando dcha es falso=>el ultimo elemento de la lista es vacio
    n--; %se reajusta el largo 
  endif
%
  if !izq %el comando izq es falso
    nodos(1)=[];%el primer elemento de la lista es vacio
    n--; %se reajusta el largo
  endif
%
%preparacion de la matriz de Vandermonde
  M=ones(n+1,n+1);
  for i=1:n
    M(i+1,:)=nodos.^i;
  endfor
%terminos independientes
  c=zeros(n+1,1);
  for i=1:n+1
    c(i,1)=(b^i-a^i)/i;
  endfor
  pesos = (M\c)'; %en forma de fila
endfunction
%


%Funciones para ahcer derivadas e integrales
%funcion pesosderiv y pesosint

function pesos=pesosderiv(k,a,nodos)
  n=length(nodos);
  M=ones(n,n);
  for i=1:n-1
    M(i+1,:)=nodos.^i;
  endfor
    %
  b=zeros(n,1);
  b(k+1,1)=factorial(k);
  for i=k+1:n-1
    b(i+1,1)=factorial(i)*a^(i-k)/factorial(i-k);
  endfor
  %
  pesos=M\b;
endfunction
%

function pesos=pesosint(a,c,nodos) %a,c limites de integracion a=inferior,c=superior
  n=length(nodos);
  M=ones(n,n);
  for i=1:n-1
    M(i+1,:)=nodos.^i;
  endfor
  %matriz de vandermonde
  b=zeros(n,1);
  for i=1:n
    b(i,1)=(c.^i-a.^i)/i;
  endfor
  %matriz de terminos independientes
  pesos=M\b;
endfunction
%

%ButcherSemi
%BUTCHER SEMI: FUNCIÓN PARA EVALUAR UN MÉTODO RK DADO DU ARREGLO DE BUTHCER
function [t1 x1] = ButcherSemi(a,b,c,t,x,h)
  m = length(c); %número de evaluaciones del metodo
  K(1) = f(t+c(1)*h,x); % K1 tiene que ir aparte
  if a(1,1)
    K(1) = fsolve(@(u)f(t+c(1)*h,x+h*a(1,1)*u)-u,K(1));
  endif
  for i=2:m
    K(i) = f(t+c(i)*h,x+h*a(i,1:i-1)*K(1:i-1)'); %explicito o semilla
    if a(i,i)
      K(i) = fsolve(@(u)f(t+c(i)*h,x+h*a(i,1:i-1)*K(1:i-1)'+h*a(i,i)*u)-u,K(i));
    endif
  endfor
  t1 = t + h;
  x1 = x + h*b*K';
endfunction
%