{ Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
 producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
 ● Código de los dos productos más baratos.
 ● Código del producto de tipo “pantalón” más caro.
 ● Precio promedio} 

program ej08;

procedure max(var maxcodigo:integer; var maxprecio:real; codigo:integer; precio:real);
begin
	if (tipo = 'pantalon') and (precio > maxprecio) then begin
		maxcodigo:=codigo;
		maxprecio:=precio
	end;
end;

procedure minimo(var mincod1,mincod2:integer; var minpre1,minpre2:real; codigo:integer; precio:real);
begin
	if minpre1>precio then begin
		minpre2:=minpre1;
		mincod2:=mincod1;
		mincod1:=codigo;
		minpre1:=precio;
	end
	else
	if minpre2>precio then begin
		minpre2:=precio;
		mincod2:=codigo;
	end;
end;

procedure ingresar(var precio:real; var codigo:integer; var pantalon:string);
begin
	readln(precio);
	readln(codigo);
	readln(pantalon);
end;

procedure ejecutar(var mincod1,mincod2,maxcodigo: integer; var minpre1,minpre2,maxprecio,prom:real);
var
	precio:real;
	codigo,i,tot:integer;
	pantalon:string;
begin
	prom := 0;
	tot := 0;
	minpre1 := 99999;
	minpre2 := 99999;
	maxprecio := -1;
	maxcodigo := -1;
	
	for i := 1 to 100 do begin
		ingresar(precio,codigo,pantalon);
		tot := tot+1;
		prom:=prom+precio;
		minimo(mincod1,mincod2,minpre1,minpre2,codigo,precio);
		max(maxcodigo,maxprecio,codigo,precio);
	end;
	
	prom := (prom/tot);
end;

procedure informar(mincod1,mincod2,maxcodigo:integer ; prom:real);
begin
	writeln('Los codigos de prenda mas baratos son: ', mincod1, ' y ', mincod2);
	writeln('El codigo del pantalon mas caro es: ', maxcodigo);
	writeln('El promedio de precio de las prendas es: ', prom);
end;

var
	mincod1,mincod2,maxcodigo:integer;
	minpre1,minpre2,maxprecio,prom:real;
begin
	ejecutar (mincod1,mincod2,maxcodigo,minpre1,minpre2,maxprecio,prom); //Proceso que retorna todo lo necesario
	informar (mincod1,mincod2,maxcodigo,prom); //Proceso que informa todo lo requerido
end.




