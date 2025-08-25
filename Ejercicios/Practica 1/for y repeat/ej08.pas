{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
 del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
 lee el monto 0. Se asume un mes de 31días. Informar la cantidad de ventas por cada día, y el monto
 total acumulado en ventas de todo el mes.
 a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
 mayor cantidad de ventas}
 program ej08;
 var
	i,maxdia:integer;
	monto,suma,sumatotal,max:real;
 begin
	sumatotal:=0;
	max:=-9999;
	
	for i:= 1 to 31 do begin
		suma:=0;
		readln(monto);
		
		while monto<>0 do begin
			suma:=suma+monto;
			readln(monto);
		end;
		
		sumatotal:=sumatotal+suma;
		
		if suma > max then begin
			max:=suma;
			maxdia:=i;
		end;
			
		writeln(suma);
	end;
	writeln('El dia que mas monto acumulado tuvo fue: ', maxdia);
 end.
