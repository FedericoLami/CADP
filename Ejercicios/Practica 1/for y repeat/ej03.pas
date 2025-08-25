{ Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
 Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
 número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
 procesarse. Al finalizar la lectura informar:
La cantidad de alumnos aprobados (nota 8 o mayor) y
la cantidad de alumnos que obtuvieron un 7 como nota}
program ej03;
var
	nom:string;
	nota,notamayor,nota7:integer;
begin
	notamayor:=0;
	nota7:=0;
	readln(nom);

	repeat
		readln(nota);
	
		if (nota>=8) then
			notamayor:=notamayor+1
		else if nota=7 then
			nota7:=nota7+1;
			
		readln(nom);	
	until nom = 'Zidane Zinedine';
	
	writeln('Alu con nota 8 o mayor: ',notamayor);
	writeln('Alu con nota 7: ', nota7); 
end.
