more off;
clc;
clear all;
disp("Ejercicio 8");
function x1=f(t,x)
  x1=[x(1)*(2-0.05*x(1)-x(2)/3);
  x(2)*(-2+0.5*x(1))];
endfunction
mu=[2;1]; a=0; b=25; h=0.1;
N=round((b-a)/h);
t=a*ones(1,N+1);
x(:,1)=mu;
for n=1:N
  t(n+1)=t(n)+h;
  fn = f(t(n),x(:,n));
  x(:,n+1)=x(:,n)+h/4*(fn+3*f(t(n)+2/3*h,x(:,n)+2/3*h*fn));
endfor
figure(1); clf; hold on;
plot(t,x(1,:),';x(t);');
figure(2); clf; hold on;
plot(t,x(2,:),';y(t);');
figure(3); clf; hold on;
plot(x(1,:),x(2,:),';x(t),y(t);');