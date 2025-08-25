{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
 almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse
  Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
 10% al precio anterior.
 Por ejemplo:
 ○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
 aumento de precio del producto 10382 no supera el 10%”
 ○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
 aumento de precio del producto 32767 es superior al 10%”}
 //NO SE RESUELVE SEGUN LOS CRITERIOS DE LA CATEDRA DE CADP
program ej07;
var
	nuepre,precio:real;
	cod:integer;
begin
	readln(cod);
	while cod <> 32767 do begin
		readln(precio);
		readln(nuepre);
		
		if (precio * 1.10 = nuepre) then
			writeln('El precio del producto: ', cod, ' es superior al 10%')
		else
			writeln('El precio del producto: ', cod, ' no es superior al 10%');
		
		readln(cod);
	end;
	readln(cod);
end.
