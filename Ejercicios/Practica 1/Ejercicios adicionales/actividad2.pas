program actividad2p1;
const
	cantMaterias = 5;
	fin = -1;
var
	legajo, ingresantePuede, recursantePuede, totalRecursantes,
	totalIngresantes, cantAproboTodo: integer;
	porcentajeRecursantes, porcentajeIngresantes, cantAutoevaluaciones, conCero: integer;
	condicion: string[1];
	nota, notaPromedio: real;
	cantNotaProm: integer;
	puede, tuvo0, aproboTodo: boolean;
	i: integer;

	cant10, cant0: integer;
	max10_1, max10_2, legajo10_1, legajo10_2: integer;
	max0_1, max0_2, legajo0_1, legajo0_2: integer;
begin
	cantNotaProm := 0;
	conCero := 0;
	cantAproboTodo := 0;
	ingresantePuede := 0;
	recursantePuede := 0;
	totalRecursantes := 0;
	totalIngresantes := 0;
	cantAutoevaluaciones := 0;

	max10_1 := -1; max10_2 := -1;
	legajo10_1 := -1; legajo10_2 := -1;

	max0_1 := -1; max0_2 := -1;
	legajo0_1 := -1; legajo0_2 := -1;

	writeln('Ingrese numero de legajo o -1 para finalizar');
	readln(legajo);

	while legajo <> fin do begin	
		notaPromedio := 0;
		tuvo0 := false;
		puede := true;
		aproboTodo := true;
		cant10 := 0;
		cant0 := 0;

		writeln('Ingrese I para INGRESANTE o R para RECURSANTE');
		readln(condicion);

		for i := 1 to cantMaterias do begin
			writeln('Ingrese nota de la autoevaluacion: ', i, ' o -1 si no la realizo');
			readln(nota);
			if nota <> -1 then
				notaPromedio := notaPromedio + nota;

			if nota = 0 then begin
				tuvo0 := true;
				cant0 := cant0 + 1;
			end;

			if nota = -1 then
				puede := false;

			if (nota <> -1) and (nota < 4) then
				aproboTodo := false;

			if nota = 10 then
				cant10 := cant10 + 1;
		end;

		notaPromedio := notaPromedio / cantMaterias;

		if notaPromedio > 6.5 then 
			cantNotaProm := cantNotaProm + 1;

		if condicion = 'I' then begin
			totalIngresantes := totalIngresantes + 1;

			if puede then begin
				ingresantePuede := ingresantePuede + 1;	
				cantAutoevaluaciones := cantAutoevaluaciones + 1;
			end;
		end;

		if condicion = 'R' then begin
			totalRecursantes := totalRecursantes + 1;
			if puede then
				recursantePuede := recursantePuede + 1;
		end;

		if tuvo0 then
			conCero := conCero + 1;

		if aproboTodo then
			cantAproboTodo := cantAproboTodo + 1;

		if cant10 > max10_1 then begin
			max10_2 := max10_1;
			legajo10_2 := legajo10_1;
			max10_1 := cant10;
			legajo10_1 := legajo;
		end else if cant10 > max10_2 then begin
			max10_2 := cant10;
			legajo10_2 := legajo;
		end;

		if cant0 > max0_1 then begin
			max0_2 := max0_1;
			legajo0_2 := legajo0_1;
			max0_1 := cant0;
			legajo0_1 := legajo;
		end else if cant0 > max0_2 then begin
			max0_2 := cant0;
			legajo0_2 := legajo;
		end;

		writeln('Ingrese numero de legajo o -1 para finalizar');
		readln(legajo);
	end;

	if (totalRecursantes > 0) then
		porcentajeRecursantes := (totalRecursantes * 100) div (totalIngresantes + totalRecursantes)
	else
		porcentajeRecursantes := 0;

	if (totalIngresantes > 0) then
		porcentajeIngresantes := (totalIngresantes * 100) div (totalIngresantes + totalRecursantes)
	else
		porcentajeIngresantes := 0;

	writeln('Cantidad de alumnos ingresantes que pueden rendir el parcial: ', ingresantePuede);
	writeln('Porcentaje de Ingresantes: ', porcentajeIngresantes, '%');
	writeln('Cantidad de alumnos recursantes que pueden rendir el parcial: ', recursantePuede);
	writeln('Porcentaje de recursantes: ', porcentajeRecursantes, '%');
	writeln('Cantidad de alumnos que aprobaron todo: ', cantAproboTodo);
	writeln('Cantidad de alumnos que tuvieron una nota promedio mayor a 6.5 fue de: ', cantNotaProm);
	writeln('Cantidad de alumnos que tuvieron cero en al menos una autoevaluacion: ', conCero);
	writeln('Legajos de los dos alumnos con más notas 10:');
	writeln('primero: ', legajo10_1, ' con ', max10_1, ' notas 10');
	writeln('segundo: ', legajo10_2, ' con ', max10_2, ' notas 10');
	writeln('Legajos de los dos alumnos con más notas 0:');
	writeln('primero: ', legajo0_1, ' con ', max0_1, ' notas 0');
	writeln('segundo: ', legajo0_2, ' con ', max0_2, ' notas 0');
end.
