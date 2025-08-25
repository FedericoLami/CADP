{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
 Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
 12    4    -10}
 
program ordenDescendente;
var
	a, b, c: integer;
	max, medio, min: integer;
begin
	writeln('Ingrese el primer número:');
	readln(a);
	writeln('Ingrese el segundo número:');
	readln(b);
	writeln('Ingrese el tercer número:');
	readln(c);

	{ Determinar el máximo }
	if (a >= b) and (a >= c) then begin
		max := a;
		if b >= c then begin
			medio := b;
			min := c;
		end else begin
			medio := c;
			min := b;
		end;
	end else if (b >= a) and (b >= c) then begin
		max := b;
		if a >= c then begin
			medio := a;
			min := c;
		end else begin
			medio := c;
			min := a;
		end;
	end else begin
		max := c;
		if a >= b then begin
			medio := a;
			min := b;
		end else begin
			medio := b;
			min := a;
		end;
	end;

	writeln(max, ' ', medio, ' ', min);
end.
