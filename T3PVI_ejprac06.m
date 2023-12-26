more off;
clc;
clear all;
disp("Ejercicio 6");
function y=f(t,x,x1)
  y=fsolve(@(u) u^2+t*x-e^(-u)-t, x1);
endfunction
mu=0; a=0; b=10; h=0.1;
x1=f(a,mu,0);
N=round((b-a)/h);
t=a*ones(1,N+1);
x=mu*ones(1,N+1);
%Trapecio
for n=1:N
  fn=f(t(n),x(n),x1);
  t(n+1)=t(n)+h;
  x(n+1)=fsolve(@(w) x(n)+h/2*(fn+f(t(n+1),w,x1))-w, x(n+1));
  x1=(x(n+1)-x(n))/h;
endfor
figure(1); clf; hold on;
plot(t,x,';xn;');