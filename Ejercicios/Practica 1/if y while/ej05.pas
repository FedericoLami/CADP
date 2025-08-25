{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
 reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
 número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}
  //NO SE RESUELVE SEGUN LOS CRITERIOS DE LA CATEDRA DE CADP
program ej4;
var
	x,num:real;
	dim:integer;
begin
	dim:=0;
	readln(x);
	num:=x;
	while (x <> num*2) and (dim < 10) do begin
		readln(x);
		dim := dim+1;
	end;
	if dim = 10 then
		writeln('No se ha ingresado el doble de X');
end.
