more off;
clc;
clear all;
disp("Ejercicio 10");
function y=F(t,x)
  y = [-4*x(1)+3*x(2)+6; -2.4*x(1)+1.6*x(2)+3.6];
endfunction
function y=ex(t)
  y = [-3.375*exp(-2*t)+1.875*exp(-0.4*t)+1.5; -2.25*exp(-2*t)+2.25*exp(-0.4*t)];
endfunction
mu=[0;0]; h=0.1; a=0; b=0.5;
N=round((b-a)/h);
t=a*ones(1,N+1);
x(:,1)=mu;
exacta(:,1)=mu;
for n=1:N
  t(n+1)=t(n)+h;
  xn=x(:,n);
  K1 = F(t(n),xn);
  K2 = F(t(n)+h/2,xn+h/2*K1);
  K3 = F(t(n)+h/2,xn+h/2*K2);
  K4 = F(t(n)+h,xn+h*K3);
  x(:,n+1) = x(:,n) + h/6*(K1+2*K2+2*K3+K4);
  exacta(:,n+1)=ex(t(n+1));
endfor
figure(1); clf; hold on;
plot(x(1,:),x(2,:),'m;aprox;',exacta(1,:),exacta(2,:),';exacta;');