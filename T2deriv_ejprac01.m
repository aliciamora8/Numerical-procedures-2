clear all;
clc;
more off;
disp("Ejercicio 1");
function y=f(x)
  y=x^3;
endfunction
%apartado a
a = 1;
disp("==========================================================");
disp(" k      h        numerador       aproximacion      error");
disp("--- ---------  -------------  -----------------  ---------");
for k=1:20
  h=10^-k;
  numerador=f(a+h)-f(a-h);
  aprox=numerador/(2*h);
  error=aprox-3;
  printf("%2d %10.2e %14.6e %18.14f %10.2e\n",k,h,numerador,aprox,error);
endfor
disp("==========================================================");
disp("");
disp("Explicacion del comportamiento.");
disp("La precision del ordenador es de unos 16 digitos.");
disp("Esto hace que para k entre 7 y 11 los errores de");
disp("truncatura y redondeo sean de magnitud similar.");
disp("A partir de k=12 el error de redondeo es muy superior,");
disp("llegando a producir un numerador nulo para k>=17.");
disp("");
disp("El valor optimo de h se obtiene para k=6. Teoricamente");
disp("se tendria que haber alcanzado en k=7 u 8, pero otros");
disp("errores de redondeo añadidos al evaluar la funcion f");
disp("podrian haber aumentado el error de la aproximacion.");
disp("==========================================================");
disp("==== FIN DEL EJERCICIO ====");