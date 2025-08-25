{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
 ingrese el número 100, el cual debe procesarse. Informar en pantalla:
 ◦ El número máximo leído.
 ◦ El número mínimo leído.
 ◦ La suma total de los números leídos.}
 
program ej05;
var
	n,suma,min,max:integer;
begin
	min:=9999;
	max:=-9999;
	suma:=0;
	repeat
		readln(n);
		if n>max then
			max:=n;
		if n<min then
			min:=n;
		suma:=suma+n;
	until n = 100;
end.
