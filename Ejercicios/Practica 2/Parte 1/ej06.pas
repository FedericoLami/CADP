{a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
 lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
 b. Implemente un programa que invoque al módulo del inciso a}
 
program ej06;

procedure leer;
var
	n,par:integer;
	
begin
	par:=-999;
	read(n);
	while n>0 do begin
		if n mod 2 = 0 then
			if n>par then
				par:=n;
		read(n);
	end;
	writeln(n);
end;

begin
	leer;
end.
