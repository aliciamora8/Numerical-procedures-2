function [x1,n,msg] = fNewtonRaphson(f,f1,x0,e,nmax) %nombre de la funcion=nombre del archivo
  x1=0; msg='ERROR DESCONOCIDO';
  
  %comprueba la tolerancia es correcta
  if e<=0
    msg='ERROR: la tolerancia no es positiva';
    return;
  endif
  
  %comprueba el limite de iteraciones es correcto
  if nmax<2 || nmax>1000 %|| es "or"
    msg='ERROR: el limite de iteraciones no es correcto';
    return;
  endif
  
  %metodo de Newton-Raphson
  n=0;
  x1=x0;
  do
    n++;
    x0=x1;
    x1=x0-f(x0)/f1(x0);
  until abs(x1-x0)/abs(x1)<=e || n>=nmax;
  
  %mensaje de salida
  if n<nmax
    msg=['Correcto']; %el corchete es irrelevante
  else
    msg=['Excedido limite'];
  endif
endfunction