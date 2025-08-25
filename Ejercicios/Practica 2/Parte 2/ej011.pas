{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
 lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
 inscripción 1200, que debe procesarse. Se pide calcular e informar:
 ● Apellido de los dos alumnos con número de inscripción más chico.
 ● Nombre de los dos alumnos con número de inscripción más grande.
 ● Porcentaje de alumnos con nro de inscripción par.}
 
program ej11;
type
	cadena = string[50];

procedure carga(var num:integer; var ape,nom:cadena);
begin
	readln(num);
	readln(ape);
	readln(nom);
end;

procedure minimo(var codmin1,codmin2:integer; var ape1,ape2:cadena; ape:cadena; num:integer);
begin
	if num<codmin1 then begin
		codmin2:=codmin1;
		ape2:=ape1;
		ape1:=ape;
		codmin1:=num;
	end
	else
	if num < codmin2 then begin
		codmin2:=num;
		ape2:=ape;
	end;
end;

procedure maximo(var codmax1,codmax2:integer ; var nom1,nom2:cadena; nom:cadena ; num:integer);
begin
	if num>codmax1 then begin
		codmax2:=codmax1;
		nom2:=nom1;
		nom1:=nom;
		codmax1:=num;
	end
	else
	if num > codmax2 then begin
		codmax2:=num;
		nom2:=nom;
	end;
end;

function pares(num:integer):boolean;		//Esta funcion no es util en sentido de eficiencia, pero la uso por el simple hecho de practicar funciones booleanas.
begin
	pares := num mod 2 = 0
end;

var
	num,par,tot,codmin1,codmin2,codmax1,codmax2:integer;
	ape,nom,ape1,ape2,nom1,nom2:cadena;
	porcentaje:real;
begin
	par:=0;
	tot:=0;
	codmax1:=-1;
	codmax2:=-1;
	codmin1:=9999;
	codmin2:=9999;
	repeat
		carga(num,ape,nom);
		if pares(num) then
			par:=(par+1);
		tot:=tot+1;
		minimo(codmin1,codmin2,ape1,ape2,ape,num);
		maximo(codmax1,codmax2,nom1,nom2,nom,num);
	until num = 1200;
	
	writeln(ape1,ape2);
	writeln(nom1,nom2);
	porcentaje := ((par/tot) * 100);
	writeln(porcentaje:2:2);
end.
