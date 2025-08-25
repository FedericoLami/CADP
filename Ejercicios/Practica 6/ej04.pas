{
4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
 a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
 b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
 c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
 lista que son múltiplos de A
}

//A)
function maximo(L: lista): integer;
var
	max: integer;
begin
	if (L = nil) then
		max := -9999  { o un valor sentinela }
	else begin
		max := L^.num;
		L := L^.sig;
		while (L <> nil) do begin
			if (L^.num > max) then
				max := L^.num;
			L := L^.sig;
		end;
	end;
	maximo := max;
end;

//B)
function minimo(L: lista): integer;
var
	min: integer;
begin
	if (L = nil) then
		min := 9999  { o un valor sentinela }
	else begin
		min := L^.num;
		L := L^.sig;
		while (L <> nil) do begin
			if (L^.num < min) then
				min := L^.num;
			L := L^.sig;
		end;
	end;
	minimo := min;
end;

//C)
function multiplos(L: lista; A: integer): integer;
var
	cant: integer;
begin
	cant := 0;
	while (L <> nil) do begin
		if (A <> 0) and (L^.num mod A = 0) then
			cant := cant + 1;
		L := L^.sig;
	end;
	multiplos := cant;
end;
