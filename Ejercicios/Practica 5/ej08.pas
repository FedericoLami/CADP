program memoria;

type
	datos = array [1..20] of integer;
	punt = ^datos;
	
procedure procesarDatos(v : datos; var v2 : datos);
var
	i, j : integer;
begin
	for i := 1 to 20 do
		v2[21 - i] := v[i];
end;

var
	vect : datos;
	pvect : punt;
	i : integer;
begin
	for i:= 1 to 20 do
		vect[i] := i;
	new(pvect);
	for i:= 20 downto 1 do
		pvect^[i] := 0;
	procesarDatos(pvect^, vect);
	writeln(‘fin’);
end.
 {
Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.

a) Hasta la sentencia de la línea 18
Solo existen las variables globales (46 bytes).
No se ejecutó new, así que no hay memoria dinámica todavía.
TOTAL = 46 bytes

b) Hasta la sentencia de la línea 20
new(pvect) reserva memoria dinámica para datos (40 bytes).
Memoria:
Estática: 46 bytes
Dinámica: 40 bytes
TOTAL = 86 bytes

c) Hasta la sentencia de la línea 23
Hasta la línea 23 (procesarDatos(pvect^, vect);)
Antes de entrar a procesarDatos, se pasa:
v (por valor): copia completa de datos → 40 bytes en stack
v2 (por referencia): puntero → 4 bytes en stack
Variables locales i y j dentro del procedimiento: 2 + 2 = 4 bytes

Memoria:
	Estática: 46 bytes
	Dinámica: 40 bytes
	Stack para llamada: 40 + 4 + 4 = 48 bytes
	TOTAL = 46 + 40 + 48 = 134 bytes

d) Hasta la sentencia de la línea 11
No hay nuevas reservas, así que el consumo es igual al del punto anterior.
TOTAL = 134 bytes

e) Hasta la sentencia de la línea 25
Cuando termina procesarDatos:
Se libera el stack del procedimiento (48 bytes), pero la memoria dinámica de pvect sigue reservada.
Memoria:
Estática: 46 bytes
Dinámica: 40 bytes
TOTAL = 86 bytes
}
