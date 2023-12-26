function [nodos pesos] = integralNC2(a,b,n,izda,dcha)
  nodos = linspace(a,b,n+1); % todos los nodos
  if !dcha
    nodos(n+1) = []; % abierta por la derecha
    n--;
  endif
  if !izda
    nodos(1) = []; % abierta por la izquierda
    n--;
  endif
  %preparacion de la matriz de Vandermonde
  M = ones(n+1,n+1); %ya va la primera fila de 1
  M(2,:) = nodos; %para evitar un posible 0^0
  for i=2:n %restante matriz de Vandermonde
    M(i+1,:) = nodos.^i;
  endfor
  %terminos independientes
  c = zeros(n+1,1);
  for i=1:n+1
    c(i,1) = (b^i-a^i)/i;
  endfor
  %printf("Matriz de Vandermonde:\n");
  %disp(M);
  %printf("Terminos independientes:\n");
  %disp(c);
  pesos = (M\c)'; %en forma de fila
endfunction