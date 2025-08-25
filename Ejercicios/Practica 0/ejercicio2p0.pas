{
Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:

	a. Utilizando una variable adicional
	b. Sin utilizar una variable adicional
}
program ej1p0;
var
	suma,num1,num2:integer;
begin
	writeln('Ingresar primer numero');
	readln(num1);
	writeln('Ingresar segundo numero');
	readln(num2);
	writeln('Se ingresaron los valores ', num2, ' y ', num1);
	suma := num1+num2;
	writeln('Suma: ', suma);
	writeln('Suma 2:', num1+num2);
end.
