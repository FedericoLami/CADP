{
Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62
}
program ej03p0;
var
	n1,n2,resultado:real;
begin
	writeln('Ingrese divisor');
	readln(n1);
	writeln('Ingrese dividendo');
	readln(n2);
	resultado := (n1/n2);
	writeln('El resultado de dividir ', n1:6:2, ' por ', n2:6:2, ' es ', resultado:6:2); 
end.
