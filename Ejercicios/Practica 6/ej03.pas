{ 3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
2022
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado}

// A)
procedure armarNodo(var L: lista; v: integer);
var
	aux, act: lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := nil;
	if (L = nil) then
		L := aux
	else begin
		act := L;
		while (act^.sig <> nil) do
			act := act^.sig;
		act^.sig := aux;
	end;
end;


// B)
procedure armarNodo(var L, ult: lista; v: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := nil;
	if (L = nil) then
		L := aux
	else
		ult^.sig := aux;
	ult := aux;
end;
