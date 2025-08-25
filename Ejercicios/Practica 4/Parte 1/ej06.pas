{
Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.
}
program intercambioMaxMin;
const
	dimf = 100;
type
	vector = array[1..dimf] of integer;

procedure cargarVector(var v: vector; var diml: integer);
var
	num: integer;
begin
	diml := 0;
	readln(num);
	while (num <> 0) and (diml < dimf) do begin
		diml := diml + 1;
		v[diml] := num;
		readln(num);
	end;
end;

procedure posicionesMaxMin(v: vector; diml: integer; var posMax, posMin: integer);
var
	i: integer;
	max, min: integer;
begin
	posMax := 1;
	posMin := 1;
	max := v[1];
	min := v[1];
	for i := 2 to diml do begin
		if v[i] > max then begin
			max := v[i];
			posMax := i;
		end;
		if v[i] < min then begin
		min := v[i];
		posMin := i;
		end;
	end;
end;

procedure intercambio(var v: vector; x, y: integer);
var
	aux: integer;
begin
	aux := v[x];
	v[x] := v[y];
	v[y] := aux;
end;

var
	v: vector;
	diml, posMax, posMin, valorMax, valorMin: integer;
begin
	writeln('Ingrese hasta 100 numeros enteros, termine con 0:');
	cargarVector(v, diml);

	if diml > 0 then begin
		posicionesMaxMin(v, diml, posMax, posMin);
		valorMax := v[posMax];
		valorMin := v[posMin];
		intercambio(v, posMax, posMin);

		writeln('El elemento maximo ', valorMax, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', valorMin, ' que se encontraba en la posicion ', posMin);
	end
	else
		writeln('No se ingresaron elementos.');
end.
