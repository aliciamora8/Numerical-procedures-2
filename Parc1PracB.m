clear all;
clc;
more off;
disp("EJERCICIO DE EXAMEN -- ALICIA MORA JODAR");
disp("");
%
%Ejercicio examen
%
%definimos la funcion g(x)
function y=g(x)
  y=(exp(-x)+1-8*x)./(2*(sin(x)+2));
endfunction
%
%Apartado 1
%
%grafica de las funciones x y g(x)
x=linspace(0,1,100); %genera 100 puntos entre 0 y 1
plot([0 1],[0 1],'k;x;', %dibuja la funcion f(x)=x
     x,g(x),'m;g;'); %dibuja g(x)
axis([0 1 0 1]); %amplitud de los ejes x e y
disp("Apartado 1.");
disp("El punto fijo de g(x) sera s, el punto donde g(s)=s.");
disp("Por la gráfica observamos que la semilla x0 se encuentra a la derecha de s,");
disp("y al ser g decreciente en [0,1], cuando apliquemos el método iterativo tendremos x0<g(x0)=x1<g(x1)=x2<... y el método divergira.");
disp("Tambien podría verse si el valor absoluto de g'(s) es menor que 1, pero es dificil de ver solo con la gráfica, de ahi el razonamiento anterior.");
disp("");
%
%Apartado 2
%
disp("Apartado 2.");
disp("Iter        Aproximacion              Dif. abs.");
disp("----     ------------------          ----------");
x0=0.25; %semilla
tol=1e-4; %tolerancia
n=0;
xa=x0;
printf(" %d       %18.16f\n",n,x0); %nos presenta la iteracion y la semilla en pantalla
do
  n++;
  x0=xa;
  x1=g(x0);
  x2=g(x1);
  xa=x0-(x1-x0)^2/(x2-2*x1+x0); %xa sera la iteracion de Steffensen, que es aplicar la aceleracion de Atiken a x0,x1,x2
  e=abs(x0-xa); %la diferencia absoluta es el valor absoluto de x0 y xa, dos iteraciones consecutivas de Steffensen
  printf("%2d       %18.16f %18.2e\n",n,xa,e); %nos presenta la iteracion por la que va el codigo, la aproximacion en esa iteracion de Steffensen y la diferencia absoluta
until e<tol; %el bucle termina cuando dos iteraciones consecutivas x0 y xa difieran menos de 1e-4
disp("==== FIN DEL EJERCICIO ====");