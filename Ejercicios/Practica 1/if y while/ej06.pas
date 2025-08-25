{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
 lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
 Por ejemplo, se lee la siguiente secuencia:
 33423
 8.40
 19003
 6.43-1
 En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
 19003, cuyo promedio fue 6.43, y finalmente el legajo-1 (para el cual no es necesario leer un
 promedio).
 Al finalizar la lectura, informar:
 ○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
 ○ La cantidad de alumnos cuyo promedio supera  6.5 (en el ejemplo anterior, se debería informar 1)
 ○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
 menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}
  //NO SE RESUELVE SEGUN LOS CRITERIOS DE LA CATEDRA DE CADP
program ej06;
var
	legajo,promSupera,cantLeidos:integer;
	prom,porcentaje:real;
begin
	porcentaje := 0;
	promSupera := 0;
	cantLeidos := 0;
	readln(legajo);
	
	while legajo<>-1 do begin
		readln(prom);
		cantLeidos := cantLeidos + 1;
		
		if prom > 6.5 then
			promSupera := promSupera + 1;
		
		if legajo < 2500 then
			porcentaje := porcentaje + 1;
			
		readln(legajo);
	end;
	writeln(cantLeidos);
	writeln(promSupera);
	porcentaje := ((porcentaje / cantLeidos)*100);
	writeln(porcentaje);
end.
