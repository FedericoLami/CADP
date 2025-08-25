{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
 autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
 participaron 100 autos. Informar en pantalla:
Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}
program ej07;
var
	nombre,primero,segundo,ultimo,penultimo:string;
	tiempo,tiempomin1,tiempomin2,tiempomax1,tiempomax2:real;
	i:integer;
begin
	tiempomin1:=9999;
	tiempomin2:=9999;
	tiempomax1:=-9999;
	tiempomax2:=-9999;
	segundo:='';
	ultimo:='';
	primero:='';
	penultimo:='';
	for i:= 1 to 100 do begin
		readln(nombre);
		readln(tiempo);
		
		if tiempo<tiempomin1 then begin
			tiempomin2:=tiempomin1;
			segundo:=primero;
			primero:=nombre;
			tiempomin1:=tiempo;
		end
		else
		if tiempo<tiempomin2 then begin
			tiempomin2:=tiempo;
			segundo:=nombre;
		end;
		
		if tiempo > tiempomax1 then begin
			tiempomax2:=tiempomax1;
			penultimo:=ultimo;
			tiempomax1:=tiempo;
			ultimo:=nombre;
		end
		else
		if tiempo > tiempomax2 then begin
			tiempomax2:=tiempo;
			penultimo:=nombre;
		end;
		
	end;
	
	writeln('Los dos primeros pilotos fueron: ', primero, ' y ', segundo);
	writeln('Los dos ultimos pilotos fueron: ', penultimo, ' y ', ultimo);
end.
