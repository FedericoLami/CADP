Dado el siguiente programa, indicar cuál es el error y su causa.
program alcance3;
var a: integer;

procedure uno;
var b: integer;
begin
	b:= 2;
	writeln(b);
end;
 
begin
	a:= 1;
	uno;
	writeln(a, b);
end.

{
El error de este ejercicio es la variable B dentro del programa principal, no esta declarada por lo tanto da error de compilacion.
}
