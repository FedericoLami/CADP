{Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.}
a) program punteros
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	pc^:= 'un nuevo texto';
	new(pc);
	writeln(pc^);
end.

a = linea vacia

b) program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc^), ' bytes');
	writeln(pc^);
	dispose(pc);
	pc^:= 'otro nuevo nombre';
end.

b = 51 bytes, un nuevo nombre


c) program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
	procedure cambiarTexto(pun: puntero_cadena);
begin
	pun^:= 'Otro texto';
end;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'Un texto';
	writeln(pc^);
	cambiarTexto(pc);
	writeln(pc^);
end.

C= Un texto, Otro texto

d) program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
	new(pun);
	pun^:= 'Otro texto';
end;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'Un texto';
	writeln(pc^);
	cambiarTexto(pc);
	writeln(pc^);
end.

D = Un texto, Un texto
