{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
 dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
 son iguales}
program ej1p1;
var
	n1,n2:integer;
begin
	read(n1);
	read(n2);
	if n1 = n2 then
		writeln(n2, ' y ', n1, ' son iguales')
	else
	if n1 > n2 then
		writeln(n1, ' es mayor que ', n2)
	else
		writeln(n2, ' es mayor que ', n1);		
end.
