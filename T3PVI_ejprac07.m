more off;
clc;
clear all;
disp("Ejercicio 7");
function x1=f(t,x)
  x1=0.05*x*(1-log(x));
endfunction
mu=1; a=0; b=100; h=[20 0.25];
figure(1); clf; hold on;
for i=1:length(h)
  hi=h(i);
  N=round((b-a)/hi);
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for n=1:N
    fn = f(t(n),x(n));
    t(n+1)=t(n)+hi;
    x(n+1)=x(n)+hi/4*(fn+3*f(t(n)+2/3*hi,x(n)+2/3*hi*fn));
  endfor
plot(t,x,[';h=' num2str(hi) ';']);
endfor