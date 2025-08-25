{Dado el siguiente programa, indicar cuál es el error.}
program alcance4;

function cuatro: integer;
begin
	cuatro:= 4;
end;

var a: integer;
begin
	cuatro;
	writeln(a);
end.

{El error se encuentra en querer invocar la funcion cuatro como un procedimiento, hay que asignarselo a una variable
o trabajarlo en una estructura de control}
