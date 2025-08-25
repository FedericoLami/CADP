{
Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
 cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
 con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
 por el camión (medida en kilómetros).
 
 a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
 cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
 
 b. Realizar un módulo que reciba el vector generado en 
	a) e informe:
	- El monto promedio transportado de los viajes realizados
	- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
	- La cantidad de viajes realizados cada día del mes.
 
 c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
 recorrida sea igual a 100 km.
 Nota: para realizar el inciso b, el vector debe recorrerse una única vez
}

program ej03;
const
	dimf = 200;
	fin = 0;
type
	registro = record
		dia: integer;
		monto:real;
		dist:integer;
	end;
	
	vector = array [1..dimf] of registro;
	cantViajes = array [1..31] of integer;

procedure iniciarViajes(var cv:cantViajes);
var
	i:integer;
begin
	for i:= 1 to 31 do
		cv[i]:=0;
end;	

procedure cargaViaje(var r:registro);
begin
	with r do begin
		readln(dist);
		if dist <> fin then begin
			readln(dia);
			readln(monto);
		end;
	end;
end;

procedure carga(var v:vector; var diml:integer);
var
	r:registro;
begin
	diml:=0;
	cargaViaje(r);
	while ((diml < dimf) and (r.dist <> fin)) do begin
		diml := diml + 1;
		v[diml] := r;
		cargaViaje(r);
	end;
end;

procedure minimoDinero(r:registro; var minMonto:real; var minDia,minReco:integer);
begin
	if r.monto<minMonto then begin
		minDia := r.dia;
		minReco := r.dist;
		minMonto := r.monto;
	end;
end;

procedure eliminarDist100(var v:vector; var diml:integer);
var
  i,j:integer;
begin
  i := 1;
  while i <= diml do begin
    if v[i].dist = 100 then begin
      for j := i to diml-1 do
        v[j] := v[j+1];
      diml := diml - 1;
    end
    else
      i := i + 1;
  end;
end;

procedure ejecutar(v:vector;diml:integer);
var
	i,totRecorrido,minDia,minReco:integer;
	prom,minMonto:real;
	cv:cantViajes;
begin
	iniciarViajes(cv);
	totRecorrido := 0;
	
	for i:= 1 to diml do begin
		totRecorrido := totRecorrido + v[i].dist;
		minimoDinero(v[i],minMonto,minDia,minReco);
		cv[v[i].dia] := cv[v[i].dia] + 1;
	end;
	
	prom := (totRecorrido/diml);
	writeln('El promedio de dinero transportado es: ', prom);
	writeln('El dia del viaje que menos dinero fue: ', minDia, ' con una  distancia recorrida de: ', minReco);
	for i:= 1 to 31 do
		writeln('Total de viajes realizados el dia ', i, ' fueron: ', cv[i]);
	
end;



var
	v:vector;
	diml:integer;
begin
	carga(v,diml);
	ejecutar(v,diml);
	eliminarDist100(v,diml);
end.
