program tanques2020;
const
	pi = 3.1416;
var
	tipo: char;
	ancho, largo, alto, radio: real;
	volumen, sumaVolCil, sumaVolRec: real;
	cantCil, cantRec, cantMenorAlto, cantMenorVol: integer;
	max1, max2: real;
begin
	sumaVolCil := 0;
	sumaVolRec := 0;
	cantCil := 0;
	cantRec := 0;
	cantMenorAlto := 0;
	cantMenorVol := 0;
	max1 := -1;
	max2 := -1;

	writeln('Ingrese tipo de tanque (R = rectangular, C = cilindrico, Z = fin):');
	readln(tipo);

	while (tipo <> 'Z') do begin
		if tipo = 'R' then begin
			writeln('Ingrese ancho (m):');
			readln(ancho);
			writeln('Ingrese largo (m):');
			readln(largo);
			writeln('Ingrese alto (m):');
			readln(alto);
			volumen := ancho * largo * alto;
			sumaVolRec := sumaVolRec + volumen;
			cantRec := cantRec + 1;
		end
		else if tipo = 'C' then begin
			writeln('Ingrese radio (m):');
			readln(radio);
			writeln('Ingrese alto (m):');
			readln(alto);
			volumen := pi * radio * radio * alto;
			sumaVolCil := sumaVolCil + volumen;
			cantCil := cantCil + 1;
		end
		else begin
			writeln('Tipo de tanque inválido.');
			volumen := 0;
		end;

		if alto < 1.40 then
			cantMenorAlto := cantMenorAlto + 1;

		if volumen < 800 then
			cantMenorVol := cantMenorVol + 1;

		if volumen > max1 then begin
			max2 := max1;
			max1 := volumen;
		end else if volumen > max2 then begin
			max2 := volumen;
		end;

		writeln('Ingrese tipo de tanque (R = rectangular, C = cilindrico, Z = fin):');
		readln(tipo);
	end;

	writeln('--- Resultados ---');
	writeln('Volumen de los dos mayores tanques vendidos:');
	writeln('1°: ', max1:0:2, ' m3');
	writeln('2°: ', max2:0:2, ' m3');

	if cantCil > 0 then
		writeln('Volumen promedio tanques cilindricos: ', (sumaVolCil / cantCil):0:2, ' m3')
	else
		writeln('No se vendieron tanques cilindricos.');

	if cantRec > 0 then
		writeln('Volumen promedio tanques rectangulares: ', (sumaVolRec / cantRec):0:2, ' m3')
	else
		writeln('No se vendieron tanques rectangulares.');

	writeln('Cantidad de tanques con alto menor a 1.40 metros: ', cantMenorAlto);
	writeln('Cantidad de tanques con volumen menor a 800 m3: ', cantMenorVol);
end.
