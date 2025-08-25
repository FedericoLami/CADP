{Dado los siguientes programas, explicar la diferencia}


{program alcance4a;
var a,b: integer;

procedure uno;
begin
	a := 1;
	writeln(a);
end;

begin
	a:= 1;
	b:= 2;
	uno;
	writeln(b, a);
end.}

{--------------------------------------------}

{program alcance4b;

procedure uno;
begin
	a := 1;
	writeln(a);
end;

var a,b: integer;
begin
	a:= 1;
	b:= 2;
	uno;
	writeln(b, a);
end.}

{
La diferencia es la utilizacion de variables globales en uno y variables globales en el otro, ademas de que el segundo tiene un error de compilacion
dado que no existe una declaracion de la variable a para el procedure 'uno'.
}
