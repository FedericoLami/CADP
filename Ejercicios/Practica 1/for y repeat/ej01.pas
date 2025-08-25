{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}
program ej01;
var
	n,suma,i:integer;
begin
	suma:=0;
	for i:= 1 to 10 do begin
		read(n);
		suma := suma + n;
	end;
	writeln(suma);
end.
