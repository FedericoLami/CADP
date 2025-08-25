{
Realice un programa que resuelva los siguientes incisos:
 a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
 cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
 b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
 c. Lea un nombre y lo inserte en la posición 4 del vector.
 d. Lea un nombre y lo agregue al vector.
 Nota: Realizar todas las validaciones necesarias.
}
program ej02;
const
	fin = 'ZZZ';
	dimf = 500;
type
	cadena = string[50];
	vector = array [1..dimf] of cadena;

procedure cargaV(var v:vector; var diml:integer);
var
	nom:cadena;
begin
	readln(nom);
	while nom<>fin do begin
		diml:=diml+1;
		v[diml]:=nom;
		readln(nom);
	end;
end;

function busqueda(v:vector;diml:integer;parametro:cadena):integer;
var
	pos:integer;
	encontre:boolean;
begin
	pos:=0;
	encontre:=false;
	while (pos<diml) and (not encontre) do begin
		pos:=pos+1;
		if v[pos] = parametro then
			encontre := true;
	end;
	if not encontre then
		busqueda := -1
	else
	busqueda:=pos;
end;

procedure borrarNom(var v:vector; var diml:integer;parametro:cadena);
var
	pos,i:integer;
begin
	pos:=busqueda(v,diml,parametro);
	if pos <> -1 then begin
		for i:= pos to diml-1 do
			v[i] := v[i+1];
		diml := diml - 1;
	end;
end;

procedure insertar(var v:vector; var diml:integer; nom:cadena);
var
	i:integer;
begin
	if (diml<dimf) then begin
		for i:= diml downto 4 do
			v[i+1] := v[i];
		v[4] := nom;
		diml := diml + 1;
	end;
end;

procedure insertaFinal(var v:vector; var diml:integer; nom:cadena);
begin
	if diml < dimf then begin
		diml := diml + 1;
		v[diml] := nom;
	end;
end;

var
  v:vector;
  diml:integer;
  nom:cadena;
begin
  diml := 0;

  { a. Carga }
  cargaV(v, diml);

  { b. Borrar nombre }
  writeln('Ingrese nombre a eliminar:');
  readln(nom);
  borrarNom(v, diml, nom);

  { c. Insertar en pos 4 }
  writeln('Ingrese nombre a insertar en posicion 4:');
  readln(nom);
  insertar(v, diml, nom);

  { d. Insertar al final }
  writeln('Ingrese nombre a agregar al final:');
  readln(nom);
  insertaFinal(v, diml, nom);
end.
