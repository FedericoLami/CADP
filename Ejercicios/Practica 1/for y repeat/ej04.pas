{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
 los dos números mínimos leídos.
 a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
 el número 0, el cual debe procesarse.
 b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
 el número 0, el cual no debe procesarse}
 
program ej04;
const
	fin = 1000;
var
	i,n,min1,min2:integer;
begin
	min1:=9999;
	min2:=9999;
	//inciso A: repeat until n=0
	//inciso B: while n<>0 do begin
	for i:= 1 to fin do begin
		readln(n);
		
		if n>min1 then begin
			min2:=min1;
			min1:=n;
		end;
		if n>min2 then
			min2:=n;
		
	end;
end.
