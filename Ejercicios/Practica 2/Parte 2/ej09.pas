{a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}
program ej09;

procedure retornoDigitos(num:integer; var tot,suma:integer);
var
	dig:integer;
begin
	while num <> 0 do begin
		dig := num mod 10;
		suma := suma+dig;
		tot := tot + 1;
		num := num div 10;
	end;
end;

var
	num,tot,suma:integer;
begin
	tot:=0;
	suma:=0;
	readln(num);
	retornoDigitos(num,tot,suma);
	writeln(tot, suma);
end.

