{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
 lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}
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
		readln(dni);
		if dni <> -1 then begin
			readln(nro);
			readln(ape);
			readln(nombre);
			readln(anio);
		end;
	end;
end;

procedure cargaVector(var v:vector; var diml:integer);
var
	r:registro;
begin
	leeRegistro(r);
	while (diml<dimf) and (r.dni <> -1) do begin
		diml:=diml+1;
		v[diml] := r;
		leeRegistro(r);
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

procedure ejecutar(v:vector;diml:integer);
var
	totpar,i,pos1,pos2,max1,max2,edad,porcentaje:integer;
begin
	totpar:=0;
	max1:=-1;
	max2:=-1;
	for i:= 1 to diml do begin
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
	diml:integer;
begin
	diml := 0;
	cargaVector(v,diml);
	ejecutar(v,diml);
end.
