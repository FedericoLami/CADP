{
a. Indicar qué hace el programa.
Lee enteros desde teclado hasta ingresar un 0 y los guarda en una lista enlazada simple, 
insertando cada nuevo elemento al inicio. El resultado es que la lista queda en orden inverso al de lectura.

b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
48, 13, 21, 10

c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
procedure imprimirLista(L: lista);
begin
    while L <> nil do begin
        writeln(L^.num);
        L := L^.sig;
    end;
end;

d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
procedure incrementarLista(L: lista; valor: integer);
begin
    while L <> nil do begin
        L^.num := L^.num + valor;
        L := L^.sig;
    end;
end;

}
program JugamosConListas;
	type
		lista = ^nodo;
		nodo = record
		num : integer;
		sig : lista;
	end;
procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;
var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln(‘Ingrese un numero’);
	read(valor);
	while (valor <> 0) then begin		//Error gravisimo, realmente no imprime nada porque esto esta mal, jodete, desaprobado y te perdes la recursada
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’);
		read(valor);
end;
. . . { imprimir lista }
end.

 
