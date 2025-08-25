{
5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
 producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
 el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
 a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
 b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
 c. Código de los dos productos más económicos
}
program ej05;
type
	cadena = string[144];
	productos = record
		cod:integer;
		desc:cadena;
		stockActu:integer;
		stockMin:integer;
		precio:real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:productos;
		sig:lista;
	end;
	
procedure cargaProductos(var p:productos);
begin
	readln(p.cod);
	if p.cod <> -1 then begin
		readln(p.desc);
		readln(p.stockActu);
		readln(p.stockMin);
		readln(p.precio);
	end;
end;

procedure cargaLista(var l:lista;p:productos);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar(var l:lista);
var
	p:productos;
begin
	cargaProductos(p);
	while p.cod <> -1 do begin
		cargaLista(l,p);
		cargaProductos(p);
	end;
end;

function tiene3Pares(dato:integer):boolean;
var
	tot,dig:integer;
begin
	tot:=0;
	while dato <> 0 do begin
		dig := dato mod 10;
		if dig mod 2 = 0 then
			tot:=tot+1;
		dato := dato div 10;
	end;
	tiene3Pares := (tot>=3);
end;

procedure esEconomico(precio:real; codigo:integer; var minP1,minP2: real; var minC1,minC2:integer);
begin
	if precio < minP1 then begin
		minP2 := minP1;
		minC2 := minC1;
		minP1 := precio;
		minC1 := codigo;
	end
	else
	if precio < minP2 then begin
		minP2 := precio;
		minC2 := codigo;
	end;
end;

procedure ejecutar(l:lista);
var
	totMenor,minC1,minC2,tot:integer;
	minP1,minP2,porcentaje:real;
begin
	tot := 0;
	totMenor := 0;
	minP1:=9999;
	minP2:=9999;
	while l<>nil do begin
		tot:=tot+1;
		if l^.dato.stockActu < l^.dato.stockMin then
				totMenor := totMenor + 1;
		if tiene3Pares(l^.dato.cod) then
			writeln(l^.dato.desc);
		esEconomico(l^.dato.precio,l^.dato.cod,minP1,minP2,minC1,minC2);
		l:=l^.sig;
	end;
	if tot <> 0 then
		porcentaje := ((totMenor / tot) * 100);
	writeln(porcentaje:2:2);
	writeln(minC1,minC2);
end;

var
	l:lista;
begin
	l:=nil;
	cargar(l);
	ejecutar(l);
end.
