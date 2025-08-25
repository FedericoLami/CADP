{
La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. 

Cada proyecto posee un código único, un título, el docente coordinador (DNI, nombre y apellido, email), 
la cantidad de alumnos que participan del proyecto, el nombre de la  escuela y la localidad a la que pertenecen. 

Cada escuela puede presentar más de un proyecto. La información se ingresa ordenada consecutivamente por localidad
y, para cada localidad, por escuela. Realizar un programa que lea la información de los proyectos hasta que se ingrese 
el proyecto con código -1 (que no debe procesarse), e informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
}
program ej08;

type
	cadena = string[50];

	docente = record
	dni: longint;
	nombre: cadena;
	apellido: cadena;
	email: cadena;
	end;

	proyecto = record
	codigo: integer;
	titulo: cadena;
	coord: docente;
	cantAlu: integer;
	escuela: cadena;
	localidad: cadena;
	end;

procedure cargarProyecto(var p: proyecto);
begin
	readln(p.codigo);
	if p.codigo <> -1 then begin
		readln(p.titulo);
		readln(p.coord.dni);
		readln(p.coord.nombre);
		readln(p.coord.apellido);
		readln(p.coord.email);
		readln(p.cantAlu);
		readln(p.escuela);
		readln(p.localidad);
	end;
end;

function codParImpar(cod: integer): boolean;
var
	dig, pares, impares: integer;
begin
	pares := 0;
	impares := 0;
	while cod <> 0 do begin
		dig := cod mod 10;
		if dig mod 2 = 0 then
			pares := pares + 1
		else
			impares := impares + 1;
		cod := cod div 10;
	end;
	codParImpar := (pares = impares);
end;

procedure actualizarMaximos(esc: cadena; cant: integer; var max1, max2: integer; var esc1, esc2: cadena);
begin
	if cant > max1 then begin
		max2 := max1;
		esc2 := esc1;
		max1 := cant;
		esc1 := esc;
	end
	else if cant > max2 then begin
		max2 := cant;
		esc2 := esc;
	end;
end;

procedure ejecutar(var totalEscuelas: integer; var escMax1, escMax2: cadena; var aluMax1, aluMax2: integer);
var
	p: proyecto;
	escuelaActual, localidadActual: cadena;
	escuelasLocalidad: integer;
	alumnosEscuela: integer;
	escContada: boolean;
begin
	totalEscuelas := 0;
	aluMax1 := -1;
	aluMax2 := -1;

	cargarProyecto(p);
	while p.codigo <> -1 do begin
		localidadActual := p.localidad;
		writeln('Localidad: ', localidadActual);
		escuelasLocalidad := 0;

		while (p.codigo <> -1) and (p.localidad = localidadActual) do begin
			escuelaActual := p.escuela;
			alumnosEscuela := 0;
			escContada := false;

			while (p.codigo <> -1) and (p.localidad = localidadActual) and (p.escuela = escuelaActual) do begin
				if (p.localidad = 'Daireaux') and codParImpar(p.codigo) then
					writeln('Título: ', p.titulo);

				alumnosEscuela := alumnosEscuela + p.cantAlu;

				if not escContada then begin
					totalEscuelas := totalEscuelas + 1;
					escuelasLocalidad := escuelasLocalidad + 1;
					escContada := true;
				end;

				cargarProyecto(p);
			end;

			actualizarMaximos(escuelaActual, alumnosEscuela, aluMax1, aluMax2, escMax1, escMax2);
			end;

		writeln('Cantidad de escuelas en localidad ', localidadActual, ': ', escuelasLocalidad);
	end;
end;

procedure informar(totalEscuelas: integer; escMax1, escMax2: cadena);
begin
	writeln('Total de escuelas participantes: ', totalEscuelas);
	writeln('Escuela con mayor cantidad de alumnos: ', escMax1);
	writeln('Segunda escuela con mayor cantidad de alumnos: ', escMax2);
end;

var
	totalEscuelas, aluMax1, aluMax2: integer;
	escMax1, escMax2: cadena;
begin
	ejecutar(totalEscuelas, escMax1, escMax2, aluMax1, aluMax2);
	informar(totalEscuelas, escMax1, escMax2);
end.
