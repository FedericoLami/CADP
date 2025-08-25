{
Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.
}

program ej05;
const
	fin = 'ZZZ';

type
	cadena = string[50];
	auto = record
		marca:cadena;
		modelo:cadena;
		precio:real;
	end;

procedure cargaRegistro(var a:auto);
begin
	readln(a.marca);
	if a.marca <> fin then begin
		readln(a.modelo);
		readln(a.precio);
	end;
end;

procedure caro(var nom:cadena; mode:cadena; maxprecio:real; a:auto);
begin
	if maxPrecio < a.precio then begin
		maxPrecio := a.precio;
		mode := a.modelo;
		nom := a.marca;
	end;
end;	

var
	a:auto;
	mar,nom,mode:cadena;
	maxprecio,precioTot,prom:real;
	tot:integer;
begin
	cargaRegistro(a);
	mar := a.marca;
	maxprecio:=-1;
	tot:=0;
	precioTot:=0;
	
	while (a.marca <> fin) do begin
		
		while (a.marca = mar) do begin
			tot := (tot+1);
			precioTot := (precioTot + a.precio);
		end;
		
		if a.marca <> mar then begin
			prom := precioTot / tot;
			writeln('El promedio es: ', prom);
			tot:=0;
			precioTot := 0;
		end;
		
		caro(nom,mode,maxprecio,a);
		
		cargaRegistro(a);
	end;
	
	writeln('El auto mas caro es de marca: ', nom, ' y es el modelo: ', mode, ' con un precio de: ', maxprecio);
end.
