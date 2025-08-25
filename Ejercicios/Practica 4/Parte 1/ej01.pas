{
a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?

El primer for carga del 1 al 10

b) Al terminar el programa, ¿con qué valores finaliza la variable números?

Toma el valor 55

c) Si se desea cambiar la línea 11 por la sentencia: for i:= 1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)?

Esto cambiaría el recorrido y no modificaría numeros[10].
Para que el resultado final sea el mismo que en b), se deberia mover la suma a numeros[i+1]
como: 
for i := 1 to 9 do
numeros[i+1] := numeros[i+1] + numeros[i];

d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:
fori:=1 to 9 do
numeros[i+1] := numeros[i];

Esto simplemente copia el valor anterior al siguiente.
Resultado final después de ejecutar sobre el array inicial [1, 2, 3, ..., 10]
}
program sumador;
type
	vnums = array [1..10] of integer;
var
	numeros : vnums;
	i : integer;
begin
	for i:=1 to 10 do {primer bloque for}
		numeros[i] := i;
	for i := 2 to 10 do {segundo bloque for}
		numeros[i] := numeros[i] + numeros [i-1]
end.
