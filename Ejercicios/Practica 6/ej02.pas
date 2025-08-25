{
Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores

1 Falta var en el parámetro p de leerPersona.
2 Tipo incorrecto de p en generarLista.
3 Parámetro l en agregarAdelante debe ser por referencia.
4 Falta reserva de memoria con new en agregarAdelante.
5 Acceso incorrecto a campos en imprimirInformacion.
6 Falta volver a leer dentro del while en generarLista.
7 Strings sin longitud fija especificada.
8 Falta end; para cerrar leerPersona.
9 Lista no inicializada antes de usarla.
}

program ejercicio2;
type
	lista = ^nodo;
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	nodo = record
		dato: persona;
		sig: lista;
	end;

procedure leerPersona(p: persona);
begin
	read(p.dni);
	if (p.dni <> 0)then begin
		read(p.nombre);
		read(p.apellido);
	end;
	
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
	p:nodo;
begin
	leerPersona(p);
	while (p.dni <> 0) do begin
		agregarAdelante(l,p);
	end;
end;

procedure imprimirInformacion(var l:lista);
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni, 'Nombre:',
		l^.nombre, 'Apellido:', l^.apellido);
		l:= l^.sig;
	end;
end;
end;
 
{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona);
var
	aux: lista;
begin
	aux^.dato:= p;
	aux^.sig:= l;
	l:= aux;
end;

{Programa principal}
var
	l:lista;
begin
	generarLista(l);
	imprimirInformacion(l);
end.
