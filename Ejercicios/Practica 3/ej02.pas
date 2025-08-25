{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.
}
program ej02;
type
	registro = record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	
procedure cargaRegistro(var r:registro);
begin
	readln(r.anio);
	if r.anio <> 2020 then begin
		readln(r.dia);
		readln(r.mes);
	end;
end;

procedure analizaVerano(mes:integer; var totmes:integer);
begin
	if((mes>=1) and (mes<=3)) then
		totmes:=totmes+1;
end;

procedure analizaDias(dia:integer; var totdia:integer);
begin
	if ((dia>=1) and (dia<=10)) then
		totdia:=totdia+1;
end;

var
	r:registro;
	totmes,totdia:integer;
begin
	cargaRegistro(r);
	totmes:=0;
	totdia:=0;
	while r.anio <> 2020 do begin
		analizaDias(r.dia,totdia);
		analizaVerano(r.mes,totmes);
		cargaRegistro(r);
	end;
end.
