{Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste:

1- procedure sumar(a, b, c : integer) no permite modificar c por fuera del procedimiento
2- variable i no está declarada
3- variable suma no inicializada
4- c := c + suma no afecta a result
5- variables a y b no declaradas en el programa principal
6- ok := (result >= 10) or (result <= 30); siempre da true, porque todo numero es >= 10 o <= 30
}

program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c }

procedure sumar(a, b, c : integer)
var
	suma : integer;
begin
	for i := a to b do
	suma := suma + i;
	c := c + suma;
end;

var
	result :  integer;
begin
	result := 0;
	readln(a); readln(b);
	sumar(a, b, 0);
	write(‘La suma total es ‘,result);
	
	{ averigua si el resultado final estuvo entre 10 y 30}
	ok := (result >= 10) or (result <= 30);
	if (not ok) then
		write (‘La suma no quedó entre 10 y 30’);
end.
