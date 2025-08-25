{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program ej04;
const
	dimf = 100;
type
	vector = array [1..dimf] of integer;

procedure cargaVector(var v: vector; var diml: integer);
var
	n: integer;
begin
	diml := 0;
	readln(n);
	while (diml < dimf) and (n <> -99) do begin
		diml := diml + 1;
		v[diml] := n;
		readln(n);
	end;
end;

procedure buscar(v: vector; diml, busqueda: integer; var parametro: integer);
var
	i: integer;
	encontrado: boolean;
begin
	parametro := -1;
	encontrado := false;
	i := 1;

	while (i <= diml) and (not encontrado) do begin
		if v[i] = busqueda then begin
			parametro := i;
			encontrado := true;
		end;
		i := i + 1;
	end;

end;

procedure intercambio(var v: vector; diml, x, y: integer);
var
	aux: integer;
begin
	if (x >= 1) and (x <= diml) and (y >= 1) and (y <= diml) the begin
		aux := v[x];
		v[x] := v[y];
		v[y] := aux;
	end;
end;

procedure sumaTotal(v: vector; diml: integer; var suma: integer);
var
	i: integer;
begin
	suma := 0;
	for i := 1 to diml do
		suma := suma + v[i];
end;

procedure promedio(suma: integer; diml: integer; var prom: real);
begin
	if diml > 0 then
		prom := suma / diml
	else
		prom := 0;
end;

procedure elementoMaximo(v: vector; diml: integer; var posMax: integer);
var
	i, max: integer;
begin
	max := v[1];
	posMax := 1;

	for i := 2 to diml do
		if v[i] > max then begin
			max := v[i];
			posMax := i;
		end;
end;

procedure elementoMinimo(v: vector; diml: integer; var posMin: integer);
var
i, min: integer;
begin
	min := v[1];
	posMin := 1;
	for i := 2 to diml do
		if v[i] < min then begin
			min := v[i];
			posMin := i;
		end;
end;

var
	v: vector;
	diml, parametro, busqueda, maxPos, minPos, suma: integer;
	prom: real;
begin
	cargaVector(v, diml);

	writeln('Ingresar numero a buscar');
	readln(busqueda);
	
	buscar(v, diml, busqueda, parametro);
	if parametro <> -1 then
		writeln('Numero encontrado en posicion: ', parametro)
	else
		writeln('Numero no encontrado');

	sumaTotal(v, diml, suma);
	promedio(suma, diml, prom);

	writeln('La suma total es: ', suma);
	writeln('El promedio es: ', prom:0:2);

	elementoMaximo(v, diml, maxPos);
	writeln('Posicion del mayor elemento: ', maxPos, ' Valor: ', v[maxPos]);

	elementoMinimo(v, diml, minPos);
	writeln('Posicion del menor elemento: ', minPos, ' Valor: ', v[minPos]);
end.

