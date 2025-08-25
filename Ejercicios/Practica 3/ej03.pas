{
El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).
}
program ej03;

const
	cantUnesco = 23.435;
	totalEscuelas = 2400;

type
	cadena = string[50];

	registro = record
		codigo: integer;
		nombre: cadena;
		cantDoc: integer;
		cantAlu: integer;
		localidad: cadena;
	end;

procedure cargaRegistro(var r: registro);
begin
	readln(r.codigo);
	readln(r.nombre);
	readln(r.cantDoc);
	readln(r.cantAlu);
	readln(r.localidad);
end;

function calcularRelacion(alumnos, docentes: integer): real;
begin
	calcularRelacion := alumnos / docentes;
end;

procedure actualizarMejores(nombre: cadena; relacion: real;
var
	mejor1, mejor2: real; var nombre1, nombre2: cadena);
begin
	if relacion < mejor1 then begin
		mejor2 := mejor1;
		nombre2 := nombre1;
		mejor1 := relacion;
		nombre1 := nombre;
	end
	else 
	if relacion < mejor2 then begin
		mejor2 := relacion;
		nombre2 := nombre;
	end;
end;

var
	r: registro;
	i, totalLaPlata: integer;
	relacion: real;
	mejor1, mejor2: real;
	nombre1, nombre2: cadena;
begin
	totalLaPlata := 0;
	mejor1 := 9999;
	mejor2 := 9999;
	nombre1 := '';
	nombre2 := '';

	for i := 1 to totalEscuelas do begin
		cargaRegistro(r);
		relacion := calcularRelacion(r.cantAlu, r.cantDoc);

	if (r.localidad = 'La Plata') and (relacion > cantUnesco) then
		totalLaPlata := totalLaPlata + 1;

	actualizarMejores(r.nombre, relacion, mejor1, mejor2, nombre1, nombre2);
	end;

	writeln('Cantidad de escuelas en La Plata con relacion > UNESCO: ', totalLaPlata);
	writeln('Escuelas con mejor relacion docente/alumno: ', nombre1, ' y ', nombre2);
end.
