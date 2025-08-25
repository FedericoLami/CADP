{ Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor-1 (que no
 debe procesarse) e informe:
 a. la cantidad de ocurrencias de cada dígito procesado.
 b. el dígito más leído.
 c. los dígitos que no tuvieron ocurrencias.
 Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
 Número 3: 2 veces
 Número 4: 2 veces
 Número 6: 2 veces
 Número 9: 4 veces
 El dígito más leído fue el 9
 Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}
 
program ej07;
type
	vector =  array [1..9] of integer;

procedure iniciarV(var v:vector);
var
	i:integer;
begin
	for i:= 1 to 9 do
		v[i] := 0;
end;

procedure lectura(var v:vector);
var
	n:integer;
begin
	writeln('Ingresar un valor numerico de 1 digito');
	readln(n);
	while n<>-1 do begin
		v[n] := v[n] + 1;
		writeln('Ingresar un valor numerico de 1 digito');
		readln(n);
	end;
end;

procedure informarDigitos(v:vector);
var
	i:integer;
begin
	for i:= 1 to 9 do
		writeln('La cantidad de digitos de ', i, ' ingresados fue: ', v[i]);
end;

procedure digitoMasLeido(v:vector);
var
	i,max,digmax:integer;
begin
	max:=-999;
	for i:= 1 to 9 do
		if v[i] > max then begin
			max:=v[i];
			digmax:=i;
		end;
	writeln('El digito mas ingresado fue: ', digmax);
end;

procedure noIngresado(v:vector);
var
	i:integer;
begin
	for i:= 1 to 9 do 
		if v[i] = 0 then
			writeln('El digito: ', v[i],' no fue ingresado');
end;

var
	v:vector;
begin
	iniciarV(v);
	lectura(v);
	informarDigitos(v);
	digitoMasLeido(v);
	noIngresado(v);
end.
