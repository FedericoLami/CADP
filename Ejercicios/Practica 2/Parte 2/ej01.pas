{
a. ¿Qué imprime si se lee el valor 10 en la variable x ?
Imprime el valor 26.

b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
Imprime 15.

c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
Se ejecuta igualmente por tener una igualacion de num1 en 0 al final del procedimiento, igualmente es ineficiente e innecesario hacerlo, por lo tanto no es correcto.
}

program Ejercicio3;

procedure suma(var num1: integer; var num2:integer);
begin
	num2 := num1 + num2;
	num1 := 0;
end;

var
	i, x : integer;
begin
	read(x); { leo la variable x }
	for i:= 1 to 5 do
		writeln(i);
		suma(i,x);
	write(x); { imprimo las variable x }
end.
