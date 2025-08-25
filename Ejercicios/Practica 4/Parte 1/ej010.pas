{ Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
 sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
 completa el vector.  Una vez finalizada la carga de datos se pide:
 a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
 módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
 retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
 b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa}
 
program ej10;
const
	dimf = 300;
type
	vector = array[1..dimf] of real;

procedure cargaVector(var v:vector; var diml:integer);
var
	n:real;
begin
	diml := 0;
	readln(n);
	while (diml < dimf) and (n <> 0) do begin
		diml := diml + 1;
		v[diml] := n;
		readln(n);
	end;
end;

procedure aumentarSalarios(x:real; var v:vector; diml:integer);
var
	i:integer;
begin
	for i := 1 to diml do
		v[i] := v[i] * x;
end;

procedure imprimirVector(v:vector; diml:integer);
var
	i:integer;
	tot,prom:real;
begin
	tot:=0;
	for i := 1 to diml do
		tot:= tot+v[i];
	prom := (tot/dimf);
	writeln(prom);
end;

var
	v:vector;
	diml:integer;
begin
	cargaVector(v, diml);
	aumentarSalarios(1.15, v, diml);
	imprimirVector(v, diml);
end.
