{
Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener
una longitud máxima de 50 caracteres.
a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.}

program CiudadesEstatico;
type
	Nombre = string[50];
	ArrCiudades = array[1..2500] of Nombre;
var
	ciudades: ArrCiudades;
begin
	writeln('Memoria necesaria: 127.500 bytes (~124,5 KB)');
end.

{b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:}

Type Nombre = String[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;
Var
	Punteros: ArrPunteros;

b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.

ArrPunteros = array[1..2500] of Puntero

{
b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?}

program CiudadesDinamico;
type
	Nombre = string[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;
var
	punteros: ArrPunteros;
	i: Integer;

procedure ReservarMemoria(var arr: ArrPunteros);
var
	j: Integer;
begin
	for j := 1 to 2500 do
		new(arr[j]); 51 bytes dinámicos por posición 
end;


begin
	writeln('Memoria estatica inicial: ', SizeOf(punteros), ' bytes');
	ReservarMemoria(punteros);
	writeln('Memoria dinamica reservada: ', 51 * 2500, ' bytes'); 
end.

{b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}

procedure LeerNombres(var arr: ArrPunteros);
var
	j: Integer;
begin
	for j := 1 to 2500 do begin
		write('Ingrese nombre de ciudad ', j, ': ');
		readln(arr[j]^);
	end;
end;



