{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
 Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
 año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
 a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
 b) Apellido y nombre de los dos alumnos de mayor edad.}
program ej08;
const
	dimf = 400;
	anioActu = 2025;
type
	cadena = string[50];
	
	registro = record
		nro:integer;
		dni:integer;
		ape:cadena;
		nombre:cadena;
		anio:integer;
	end;
	
	vector = array[1..dimf] of registro;

procedure leeRegistro(var r:registro);
begin
	with r do begin
		readln(nro);
		readln(dni);
		readln(ape);
		readln(nombre);
		readln(anio);
	end;
end;

procedure cargaVector(var v:vector);
var
	i:integer;
	r:registro;
begin
	for i:= 1 to dimf do begin
		leeRegistro(r);
		v[i] := r;
	end;
end;

function esPar(dni:integer):boolean;
begin
	if dni mod 2 = 0 then
		esPar := true
	else
		esPar := false;
end;

procedure mayores(var pos1,pos2,max1,max2:integer; edad,posicion:integer);
begin
	if edad>max1 then begin
		max2:=max1;
		pos2:=pos1;
		max1:=edad;
		pos1:=posicion;
	end
	else
	if edad>max2 then begin
		max2:=edad;
		pos2:=posicion;
	end;		
end; 

procedure ejecutar(v:vector);
var
	totpar,i,pos1,pos2,max1,max2,edad,porcentaje:integer;
begin
	totpar:=0;
	max1:=-1;
	max2:=-1;
	for i:= 1 to dimf do begin
		if esPar(v[i].dni) then
			totpar:=totpar+1;
		edad := (anioActu - v[i].anio); 
		mayores(pos1,pos2,max1,max2,edad,i);
	end;
	porcentaje := ((totpar div dimf) * 100);		//Me evito un error de smallint
	
	writeln('Los dos alumnos mayores fueron: ', v[pos1].nombre, ' ', v[pos1].ape, ' y ', v[pos1].nombre, ' ', v[pos1].ape);
	writeln('El porcentaje total de alumnos con dni par es: ', porcentaje);
end;
var
	v:vector;
begin
	cargaVector(v);
	ejecutar(v);
end.
