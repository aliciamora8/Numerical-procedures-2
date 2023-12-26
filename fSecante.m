function [x2,n,msg] = fSecante(f,x0,x1,e,nmax) %nombre de la funcion=nombre del archivo
  x2=0; msg= 'ERROR DESCONOCIDO';
  
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
  
  %metodo de la Secante
  n=0;
  x2=x1;
  x1=x0;
  do
    n++;
    x0=x1;
    x1=x2;
    x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
  until abs(x2-x1)/abs(x2)<=e || n>=nmax;
  
  %mensaje de salida
  if n<nmax
    msg='Correcto'; 
  else 
    msg='Excedido limite';
  endif
endfunction
%int2str(n) cadena de caracteres, convierte caracteres en una lista