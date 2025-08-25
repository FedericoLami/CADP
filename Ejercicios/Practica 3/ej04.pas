{
Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}
program ej04;
const
	precioMin = 3.40;
	precioMB = 1.35;
	clientes = 9300;
type
	cliente = record
		codigo:integer;
		cantLineas:integer;
	end;
	propLinea = record
		num:integer;
		cantMin:real;
		mb:real;
	end;
	
procedure cargaPropLineas(var pl:propLinea);
begin
	readln(pl.num);
	readln(pl.cantMin);
	readln(pl.mb);
end;

procedure cargaCliente(var c:cliente);
begin
	readln(c.codigo);
	readln(c.cantLineas);
end;

procedure ejecutar(var c:cliente;var totMin, totMB:real);
var
	pl:propLinea;
	i:integer;
begin
	for i:= 1 to c.cantLineas do begin
		cargaPropLineas(pl);
		totMin := totMin + pl.cantMin;
		totMB := totMB + pl.mb
	end;
end;

var
	c:cliente;
	facturaMin,facturaMB,totMin,totMB:real;
	i:integer;
begin
	for i:= 1 to clientes do begin
		totMin:=0;
		totMB:=0;
		cargaCliente(c);
		ejecutar(c,totMin,totMB);
		facturaMin := totMin * precioMin;
		facturaMB := totMB * precioMB;
		writeln('Total a cobrar de MB: ', facturaMB, ' y total a cobrar por minutos de llamada: ', facturaMin);
	end;
end.
