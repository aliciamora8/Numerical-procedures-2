clear all;
clc;
more off;
disp("Ejercicio 3");
function y=f(t,x)
  [y(1)=x(1)-t*x(2)+sin(3*t);
  y(2)=2*x(1)+x(2)-t];
endfunction
mu=[5 -1]; a=0; b=3; h=0.25;
N=(b-a)/h;
%Euler
t = linspace(a,b,N+1);
x(1,:) = mu;
for n=1:N
  x(n+1,:) = x(n,:) + h*f(t(n),x(n,:));
endfor
figure(1); clf; hold on;
plot(x(:,1),x(:,2),'b;Euler;');
%Runge Kutta clásico
x(1,:)=mu;
for n=1:N
  K1 = f(t(n),x(n,:));
  K2 = f(t(n)+h/2,x(n,:)+h/2*K1);
  K3 = f(t(n)+h/2,x(n,:)+h/2*K2);
  K4 = f(t(n)+h,x(n,:)+h*K3);
  x(n+1,:) = x(n,:) + h/6*(K1+2*K2+2*K3+K4);
endfor
plot(x(:,1),x(:,2),'m;RK4;');
hold off;
disp("==== FIN DEL EJERCICIO ====");