function [xs,n,msg]=fNewtonRaphson2(f,f1,x0,tol,nmax)
n=0;
xs=x0;
do 
  n++;
  x0=xs;
  xs=x0-f(x0)/f1(x0);
until abs(xs-x0)/abs(xs)<=tol||n>=nmax;
%
if n<=nmax;
  msg=['Converge'];
else
  msg=['No converge'];
endif
endfunction