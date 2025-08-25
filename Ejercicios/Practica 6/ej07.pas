{
El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios

:- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.

A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.
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
