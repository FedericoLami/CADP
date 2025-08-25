{
Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado)
}
program ej08;

procedure insertarOrdenado(var l:lista; nueDato:dato);
var
	act,nue,ant:lista;
begin
	new(nue);
	nue^.dato := nueDato;
	nue^.sig := nil;
	
	act := l;
	ant := nil;
	
	while act<>nil and act^.dato < nueDato
end;

begin
end;
