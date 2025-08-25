{
 6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
 al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
 (cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
 rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
 1. radio;   2. microondas;   3.infrarrojo;   4. luz visible;  5. ultravioleta;   6. rayos X;   7. rayos gamma
 Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
 ingresar la sonda llamada “GAIA”, que debe procesarse.
 Una vez finalizada la lectura, informar:
 a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
 b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
 c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
 d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
 Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}
program ej06;
type
	cadena = string[50];
	sonda = record
		nom:cadena;
		dur:integer;
		costoCon:real;
		costoMan:real;
		rangoEle:integer;
	end;

	lista = ^nodo;
	nodo = record
		dato:sonda;
		sig:lista;
	end;

	vector = array [1..7] of integer;

procedure iniciarVector(var v:vector);
var
	i:integer;
begin
	for i:= 1 to 7 do
		v[i] := 0;
end;

procedure cargaSonda(var s: sonda);
begin
	with s do begin
		readln(nom);
		readln(dur);
		readln(costoCon);
		readln(costoMan);
		readln(rangoEle);
	end;
end;

procedure cargaLista(var l:lista; s:sonda);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := s;
	nue^.sig := l;
	l:=nue;
end;

procedure cargar(var l:lista);
var
	s:sonda;
begin
	repeat
		cargaSonda(s);
		cargaLista(l,s);
	until s.nom = 'GAIA';
end;

procedure costosa(nombre:cadena;costoFinal:real; var costoMax:real; var costoNom:cadena);
begin
	if costoFinal > costoMax then begin
		costoNom := nombre;
		costoMax := costoFinal;
	end;
end;

procedure calcularPromedios(l:lista; var promCosto, promDur:real);
var
	tot:integer;
	acumCosto, acumDur:real;
begin
	tot := 0;
	acumCosto := 0;
	acumDur := 0;
	while l <> nil do begin
		tot := tot + 1;
		acumCosto := acumCosto + l^.dato.costoCon;
		acumDur := acumDur + l^.dato.dur;
		l := l^.sig;
	end;
	if tot > 0 then begin
		promCosto := acumCosto / tot;
		promDur := acumDur / tot;
	end;
end;

procedure ejecutar(l:lista);
var
	promCosto, promDur:real;
	costoMax, costoFinal:real;
	costoNom:cadena;
	v:vector;
	superaProm, superaPromDur:integer;
	aux:lista;
begin
	costoMax := -9999;
	superaProm := 0;
	superaPromDur := 0;
	iniciarVector(v);

	calcularPromedios(l, promCosto, promDur);

	aux := l;
	while aux <> nil do begin
		costoFinal := aux^.dato.costoCon + aux^.dato.costoMan;
		costosa(aux^.dato.nom, costoFinal, costoMax, costoNom);

		v[aux^.dato.rangoEle] := v[aux^.dato.rangoEle] + 1;

		if aux^.dato.costoCon > promCosto then
			superaProm := superaProm + 1;

		if aux^.dato.dur > promDur then
			superaPromDur := superaPromDur + 1;

		aux := aux^.sig;
	end;

	writeln('a) La sonda mas costosa fue: ', costoNom);
	writeln('b) Cantidad de sondas por rango del espectro:');
	for superaPromDur := 1 to 7 do
		writeln('   Rango ', superaPromDur, ': ', v[superaPromDur]);

	writeln('c) Cantidad de sondas cuya duracion supera la duracion promedio: ', superaPromDur);
	writeln('d) Cantidad de sondas cuyo costo de construccion supera el promedio: ', superaProm);
end;

var
	l:lista;
begin
	l:=nil;
	cargar(l);
	ejecutar(l);
end.
