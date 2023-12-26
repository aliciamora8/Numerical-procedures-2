function [nodos pesos]=integralNC(a,b,n,izda,dcha)
  nodos=linspace(a,b,n+2);
  if !dcha;
    nodos(n+2)=[];
    n--;
  endif
  if !izda;
    nodos(1)=[];
    n--;
  endif
  M=ones(n+2,n+2);
  M(2,:)=nodos;
  for i=3:n+2
    M(i,:)=nodos.^(i-1);
  endfor
  c=zeros(n+2,1);
  for i=1:n+2
    c(i,1)=(b^i-a^i)/i;
  endfor
  pesos=M\c;
endfunction