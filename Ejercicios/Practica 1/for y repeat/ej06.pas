{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
 se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
Los códigos de los dos productos más baratos.
La cantidad de productos de más de 16 pesos con código par.}

program ej06;
var
	i,cod,mincod1,mincod2,tot:integer;
	precio,min1,min2:real;
begin
	min1:=9999;
	min2:=9999;
	mincod1:=0;
	mincod2:=0;
	tot:=0;
	for i:= 1 to 200 do begin
		readln(cod);
		readln(precio);
		
		if precio<min1 then begin
			min2:=min1;
			mincod2:=mincod1;
			min1:=precio;
			mincod1:=cod;
		end
		else
		if precio<min2 then begin
			min2:=precio;
			mincod2:=cod;
		end;
		
		if (cod mod 2 = 0) and (precio > 16) then
			tot:=tot+1;
	end;
	writeln('productos con menor precio fueron: ', mincod1, ' y ', mincod2);
	writeln('cantidad de productos de más de 16 pesos con codigo par: ', tot);
end.
