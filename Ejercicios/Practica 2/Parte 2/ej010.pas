{ Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
 el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
 pares y la cantidad de dígitos impares que posee.}
program ej010;
const
	fin = 12345;	//Elimine el 6 dado el rango de numeros, se escapa de lo que pascal admite con la declaracion de integer, sino deberia ser longInt

procedure sumaPares(num:integer; var pares:integer);
var
	dig:integer;
begin
	while num <> 0 do begin
		dig := num mod 10;
		
		if dig mod 2 = 0 then
			pares := (pares+dig);
		
		num := num div 10;
	end;
end;

procedure sumaImpares(num:integer; var impares:integer);
var
	dig:integer;
begin
	while num<>0 do begin
		dig := num mod 10;
		
		if dig mod 2 <> 0 then
			impares := (impares+1);
		
		num := num div 10;
	end;
end;

var
	pares,impares,num:integer;
begin
	readln(num);
	while num<>fin do begin
		pares:=0;
		impares:=0;
		sumaPares(num,pares);
		sumaImpares(num,impares);
		writeln('La suma de sus digitos pares es: ',pares);
		writeln('El total de digitos impares que posee es: ', impares);
		readln(num);
	end;
end.
