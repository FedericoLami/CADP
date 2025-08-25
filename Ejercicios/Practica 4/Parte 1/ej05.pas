{
Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
 desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
 la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
 operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
 fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
}
program ej05;
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

function posMaximo(v: vector; diml: integer): integer;
var
	i, posMax, max: integer;
begin
	max := v[1];
	posMax := 1;
	for i := 2 to diml do begin
		if v[i] > max then begin
			max := v[i];
			posMax := i;
		end;
	end;
	posMaximo := posMax;
end;

function posMinimo(v: vector; diml: integer): integer;
var
	i, posMin, min: integer;
begin
	min := v[1];
	posMin := 1;
	for i := 2 to diml do begin
		if v[i] < min then begin
		min := v[i];
		posMin := i;
		end;
	end;
	posMinimo := posMin;
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
	diml, posMax, posMin: integer;
begin
	writeln('Ingrese hasta 100 numeros enteros, termine con 0:');
	cargarVector(v, diml);

	if diml > 0 then begin
		posMax := posMaximo(v, diml);
		posMin := posMinimo(v, diml);
		intercambio(v, posMax, posMin);

		writeln('El elemento maximo ', v[posMin], ' que se encontraba en la posicion ', posMax,
				' fue intercambiado con el elemento minimo ', v[posMax], ' que se encontraba en la posicion ', posMin);
		end
		else
		writeln('No se ingresaron elementos.');
end.
