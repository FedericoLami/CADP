{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.

puntero_cadena = ^cadena → es un puntero a un string[50] (longitud maxima 50).

sizeof(pc) → devuelve el tamaño del puntero en si, no de lo que apunta.

sizeof(pc^) → devuelve el tamaño de la cadena completa reservada (50 caracteres + 1 byte de longitud = 51 bytes).

}

program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	writeln(sizeof(pc), ' bytes');
	new(pc);
	writeln(sizeof(pc), ' bytes');
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc), ' bytes');
	writeln(sizeof(pc^), ' bytes');
	pc^:= 'otro nuevo nombre distinto al anterior';
	writeln(sizeof(pc^), ' bytes');
end.
