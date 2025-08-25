{ Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio}
program ej014;

procedure calcularRendimiento(ha: integer; zona: integer; precio: real; var rendimiento: real);
var
	toneladasPorHa: real;
begin
	if zona = 1 then
		toneladasPorHa := 6.0
	else if zona = 2 then
		toneladasPorHa := 2.6
	else
		toneladasPorHa := 1.4;

	rendimiento := ha * toneladasPorHa * precio;
end;

procedure procesarCampos;
var
	localidad, localidadMax, localidadMin: string;
	ha, zona: integer;
	rendimiento, maxRend, minRend, sumaRend: real;
	precio: real;
	cantTresFebrero, totalCampos: integer;
begin
	precio := 320;
	cantTresFebrero := 0;
	sumaRend := 0;
	totalCampos := 0;
	maxRend := -1;
	minRend := 999999;

	repeat
		writeln('Ingrese localidad:');
		readln(localidad);
		writeln('Ingrese cantidad de hectáreas:');
		readln(ha);
		writeln('Ingrese tipo de zona (1, 2 o 3):');
		readln(zona);

		calcularRendimiento(ha, zona, precio, rendimiento);

		if (localidad = 'Tres de Febrero') and (rendimiento > 10000) then
			cantTresFebrero := cantTresFebrero + 1;

		if rendimiento > maxRend then begin
			maxRend := rendimiento;
			localidadMax := localidad;
		end;

		if rendimiento < minRend then begin
			minRend := rendimiento;
			localidadMin := localidad;
		end;

		sumaRend := sumaRend + rendimiento;
		totalCampos := totalCampos + 1;

	until (localidad = 'Saladillo') and (ha = 900);


	writeln('--- Resultados ---');
	writeln('Cantidad de campos en Tres de Febrero con rendimiento > U$S 10.000: ', cantTresFebrero);
	writeln('Localidad con mayor rendimiento económico: ', localidadMax);
	writeln('Localidad con menor rendimiento económico: ', localidadMin);
	
	if totalCampos > 0 then
		writeln('Rendimiento económico promedio: U$S ', (sumaRend / totalCampos):0:2)
	else
		writeln('No se ingresaron campos.');
end;

begin
	procesarCampos;
end.
