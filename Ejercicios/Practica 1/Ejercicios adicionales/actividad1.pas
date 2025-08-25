program actividad1p1;
const
	fin = 100;
	mayor = 50000;
var
	i,cant,codigo,maxcodigo,cantidad:integer;
	monto,promedio,total,maxmonto:real;
begin
	total:=0;
	maxmonto:=-1;
	cantidad:=0;
	
	repeat
		writeln('ingrese codigo de empresa o 100 para finalizar');
		readln(codigo);
		writeln('ingrese cantidad de inversiones realizadas');
		readln(cant);
		
		for i:= 1 to cant do begin
			writeln('ingrese el monto de la inversion: ', i);
			readln(monto);
			total:=total+monto;
		end;
		
		promedio := total/cant;
		
		if total>mayor then
			cantidad:=cantidad+1;
		
		if total>maxmonto then begin
			maxcodigo:=codigo;
			maxmonto:=total;
		end;
	
		writeln('el promedio de sus inversiones es: ', promedio);
	until codigo = 100;
	
	writeln('La cantidad de empresas con inversiones mayor a 5000 fue: ', cantidad);
	writeln('La empresa con codigo: ', maxcodigo,' fue la que mayor monto total invertido tuvo');
end.
