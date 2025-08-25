{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
 ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
 información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
 comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
 lectura, el programa debe procesar los datos e informar:
 a) Título de la foto más vista (la que posee mayor cantidad de clics).
 b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
 c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program ej11;
const
	dimf = 200;
	autor = 'Art Vandelay';
type
	cadena = string[50];
	registro = record
		tit:cadena;
		aut:cadena;
		likes:integer;
		clics:integer;
		cantComen:integer;
	end;
	
	vector = array [1..dimf] of registro;

procedure cargaRegistro(var r:registro);
begin
	with r do begin
		readln(tit);
		readln(aut);
		readln(likes);
		readln(clics);
		readln(cantComen);
	end;
end;

procedure cargaVector(var v:vector);
var
	i:integer;
	r:registro;
begin
	for i := 1 to dimf do begin
		cargaRegistro(r);
		v[i] := r;
	end;
end;

procedure incisoA(var pos,max:integer;posicion,clics:integer);
begin
	if clics > max then begin
		max:=clics;
		pos:=posicion;
	end;
end;

function esAutor(nombre:cadena):boolean;
begin
	if nombre = autor then
		esAutor := true
	else
		esAutor := false;
end;

procedure ejecutar(v:vector);
var
	pos,max,totmg,i,totcom:integer;
begin
	max := -999;
	totcom := 0;
	totmg := 0;
	pos := -1;	//Para evitar el warning
	
	for i:= 1 to dimf do begin
		incisoA(pos,max,pos,v[i].clics);
	
		if esAutor(v[i].aut) then
			totmg := totmg + v[i].likes;
			
		totcom := totcom + v[i].cantComen;
		
	end;
	writeln('Total de comentarios: ', totcom);
	writeln('Cantidad de me gustas al autor: ', autor, ' fue de: ', totmg);
	writeln('Imagen con mas clics fue: ', v[pos].tit);
end;

var
	v:vector;
begin
	cargaVector(v);
	ejecutar(v);
end.
