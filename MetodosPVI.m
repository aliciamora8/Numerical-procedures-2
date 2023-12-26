%MÉTODOS PVI


N =round((b-a)/h);

%Euler explícito
t = linspace(a,b,N+1);
x(1,:) = x0;
for n=1:N
  x(n+1,:) = x(n,:) + h*F(t(n),x(n,:));
endfor
%
%
% Runge-Kutta 4
x(1,:) = x0;
for n=1:N
  t(n+1)=t(n)+h;
  K1 = F(t(n),x(n,:));
  K2 = F(t(n)+h/2,x(n,:)+h/2*K1);
  K3 = F(t(n)+h/2,x(n,:)+h/2*K2);
  K4 = F(t(n)+h,x(n,:)+h*K3);
  x(n+1,:) = x(n,:) + h/6*(K1+2*K2+2*K3+K4);
endfor
%
%
%Euler implicito
t = a*ones(1,N+1);
x = mu*ones(1,N+1);
for n=1:N
  x(n+1) = x(n) + h*f(t(n),x(n),x1);
  t(n+1) = t(n) + h;
  x1 = (x(n+1)-x(n))/h; % proxima semilla
endfor
%
%
%Trapecio
t = a*ones(1,N+1);
x = mu*ones(1,N+1);
for n=1:N
  fn = f(t(n),x(n),x1);
  x(n+1) = fsolve(@(w) x(n)+h/2*(fn+f(t(n)+h,w,x1))-w, x(n));
  t(n+1) = t(n) + h;
  x1 = (x(n+1)-x(n))/h; % proxima semilla
endfor
%
%
%Butcher semi
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