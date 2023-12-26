clear all;
clc;
more off;
disp("Ejercicio 11");
disp("Apartado a)");
function y=F(t,x)
  y=[x(2);
  -5*x(1)-4*x(2)];
endfunction
function y=ex(t)
  y=3*exp(-2*t)*cos(t)+exp(-2*t)*sin(t);
endfunction
mu=[3;-5]; a=0; b=5; h=0.1;
N=round((b-a)/h);
t=a*ones(1,N+1);
x(:,1)=mu;
exacta=mu(1,1)*ones(1,N+1);
for n=1:N
  t(n+1)=t(n)+h;
  K1 = F(t(n),x(:,n));
  K2 = F(t(n)+h/2,x(:,n)+h/2*K1);
  K3 = F(t(n)+h/2,x(:,n)+h/2*K2);
  K4 = F(t(n)+h,x(:,n)+h*K3);
  x(:,n+1) = x(:,n) + h/6*(K1+2*K2+2*K3+K4);
  exacta(n+1)=ex(t(n+1));
endfor
figure(1); clf; hold on;
plot(t,x(1,:),';RK4;',t,exacta,'m;exacta;');
title("La gráfica");
xlabel("La x"); ylabel("La y");