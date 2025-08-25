{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.

cadena = string[9] → cadena con longitud máxima 9 caracteres, pero internamente ocupa 9 + 1 = 10 bytes (1 byte para almacenar la longitud y 9 para los caracteres).

producto =
codigo: integer → 4 bytes
descripcion: cadena → 10 bytes
precio: real → 8 bytes (tipo real por defecto en Pascal)
Total: 4 + 10 + 8 = 22 bytes

puntero_producto → puntero a un producto.

Tamaño del puntero → 4 bytes en 32 bits, 8 bytes en 64 bits
}
program punteros;
type
	cadena = string[9];
	
	producto = record
		codigo: integer;
		descripcion: cadena;
		precio: real;
	end;
	
	puntero_producto = ^producto;
var
	p: puntero_producto;
	prod: producto;
begin
	writeln(sizeof(p), ' bytes');
	writeln(sizeof(prod), ' bytes');
	new(p);
	writeln(sizeof(p), ' bytes');
	p^.codigo := 1;
	p^.descripcion := 'nuevo producto';
	writeln(sizeof(p^), ' bytes');
	p^.precio := 200;
	writeln(sizeof(p^), ' bytes');
	prod.codigo := 2;
	prod.descripcion := 'otro nuevo producto';
	writeln(sizeof(prod), ' bytes');
end.
