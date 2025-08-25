{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios}

program ej07;
type
	cadena = string[50];
	registro = record
		nom:cadena;
		universidad:cadena;
		cantInv:integer;
		cantBec:integer;
	end;

procedure cargaRegistro(var r:registro);
begin
	with r do begin
		if cantInv <> 0 then begin
			readln(nom);
			readln(universidad);
			readln(cantBec);
		end;
	end;
end;

procedure maximo(totInv:integer; nombre:cadena; var invMax:integer; var uniMax:cadena);
begin
	if totInv>invMax then begin
		invMax:=totInv;
		uniMax:=nombre;
	end;
end;

procedure minimo(totBec:integer; uni:cadena; var becmin1,becmin2:integer ; var unimin1,unimin2:cadena);
begin
	if becmin1>totBec then begin
		becmin2:=becmin1;
		unimin2:=unimin1;
		unimin1:=uni;
		becmin1:=totBec;
	end
	else
	if becmin2>totBec then begin
		becmin2:=totBec;
		unimin2:=uni;
	end;
end;

procedure ejecutar(var totCentros, invMax, becmin1, becmin2: integer; var uniMax, unimin1, unimin2: cadena);
var
	r:registro;
	uni:cadena;
	totCentros,totInv,totBec:integer;
begin
	cargaRegistro(r);
	if (r.cantInv <> 0) then begin
		uni := r.universidad;
		totCentros := 0;
		totInv := 0;
		invMax:=-1;
		becmin1:=9999;
		becmin2:=9999;
	end;
	while (r.cantInv <> 0) do begin	
		if (r.universidad = uni) then begin
			totCentros := (totCentros + 1);
			totInv := (totInv + r.cantInv);
			totBec := totBec + r.cantBec);
		end
		else
		if (r.universidad <> uni) then begin
			maximo(totInv,uni,invMax,uniMax);
			minimo(totBec,uni,becmin1,becmin2,unimin1,unimin2);
			totCentros := 0;
			totInv := 0;
			uni:=r.universidad
		end;
		cargaRegistro(r);
	end;	
end;

procedure informar(totCentros: integer;uniMax: cadena;becmin1, becmin2: integer;unimin1, unimin2: cadena);
begin
	writeln('Cantidad total de centros en la última universidad procesada: ', totCentros);
	writeln('Universidad con mayor cantidad de investigadores en sus centros: ', uniMax);
	writeln('Centro con menor cantidad de becarios: ', unimin1, ' (', becmin1, ' becarios)');
	writeln('Segundo centro con menor cantidad de becarios: ', unimin2, ' (', becmin2, ' becarios)');
end;

var
	totCentros, invMax, becmin1, becmin2: integer;
	uniMax, unimin1, unimin2: cadena;
begin
	ejecutar(invMax,becmin1,becmin2);
	informar(totCentros, uniMax, becmin1, becmin2, unimin1, unimin2);
end.
