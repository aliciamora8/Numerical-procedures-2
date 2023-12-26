more off;
clc;
clear all;
function y=F(t,x)
  y=x-t.^2+1;
endfunction
function y=exct(t)
  y=(t+1).^2-1/2.*exp(t);
endfunction
%
mu=4-e/2; 

%Apartado 1
h1=0.1; h2=0.05;
a1=1; b1=2; c1=3;
n1=round((b1-a1)/h1);
n2=round((c1-b1)/h2);
t1=linspace(a1,b1,n1+1);
t2=linspace(b1+h2,c1,n2);
t=[t1,t2];
exacta=exct(t);
figure(1); clf; hold on;
plot(t,exacta,';exacta;');

%Apartado 2
%tramo 1
function y=f(t,x,xd)
  y=x-t.^2+1-xd;
endfunction
xd=f(1,mu,0);
x1=mu*ones(1,n1+1);
for n=1:n1
  x1(n+1) = x1(n) + h1*f(t(n),x1(n),xd);
  xd = (x1(n+1)-x1(n))/h1; % proxima semilla
endfor
%tramo 2
x2=x1(1,n1+1)*ones(1,n2+1);
for n=1:n2
  K1=F(t(n),x2(n));
  K2 = F(t(n)+h2/2,x2(n)+h2/2*K1);
  K3 = F(t(n)+h2/2,x2(n)+h2/2*K2);
  K4 = F(t(n)+h2,x2(n)+h2*K3);
  x2(n+1) = x2(n) + h2/6*(K1+2*K2+2*K3+K4);
endfor
%unir tramo 1 y 2
x2(1)=[];
x=[x1,x2];
plot(t,x,'r;aproximada;');

%Apartado 3
%En t=1 usamos la formula progresiva
a=1/h1*(F(1,1+h1)-F(1,1));
%En t=3 usamos la formula regresiva
b=1/h2*(F(3,3)-F(3,3-h2));
%En t=2 usamos el promedio de las dos anteriores
c=(a+b)/2;
%calculamos el resto mediante la formula centrada
d1=a*ones(1,n1);
for i=1:n1-1
  d1(i+1)=1/h1*(F(t1(i),t1(i)+h1)-F(t1(i),t1(i)-h1));
endfor
d2=b*ones(1,n2);
for k=1:n2-1
  d2(i+1)=1/h2*(F(t2(i),t2(i)+h2)-F(t2(i),t2(i)-h2));
endfor
d1(1)=[];
d2(1)=[];
%unimos a, b, c, d1 y d2
dn=[a,d1,b,d2,c];
disp(dn);
figure(2); clf; hold on;
plot(t,dn,'m;derivada aprox;');
%calculamos la derivada exacta
N=length(t);
exacta=mu*ones(1,N)
for i=1:N-1
  exacta(i+1)=F(t(i),x(i));
endfor
plot(t,exacta,'c;derivada exacta;');