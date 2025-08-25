{
 a. Dado unvector deenteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
 n y retorne si n se encuentra en el vector o no.
 b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
 ascendente.
}
program ej01;
const
	dimf = 500;
type
	vector = array [1..dimf] of integer;

procedure cargaV(var v:vector; var diml:integer);
var
	n:integer;
begin
	readln(n);
	while (n <> -1) and (diml < dimf) do begin
		diml := (diml+1);
		v[diml] := n;
		readln(n);
	end;
end;

function existe(v:vector;diml:integer;n:integer): boolean;
var
	i:integer;
	ok:boolean;
begin
	ok:=false;
	for i:= 1 to diml do 
		if v[i] = n then
			ok:=true;
	existe := ok;
end;

function existeVersion2(v:vector; diml:integer; n:integer):boolean;
var
	ok:boolean;
	dim:integer;
begin
	dim:=1;
	ok:=false;
	while ((not ok) and (dim < diml)) do begin
		if v[dim] = n then
			ok:=true
		else
			dim:=dim+1;
	end;
	existeVersion2:=ok;
end;

var
	v:vector;
	diml,n:integer;
begin
	diml := 0;
	cargaV(v,diml);
	readln(n);
	if existe(v,diml,n) then
		writeln('existe');
	readln(n);
	if existeVersion2(v,diml,n) then
		writeln('existe');
end.
