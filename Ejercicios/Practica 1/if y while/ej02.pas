{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
 número X, se escribe |X| y se define como:
 |X| = X cuando X es mayor o igual a cero
 |X| = -X cuando X es menor a cero}
 program
 var
	x:integer;
 begin
	read(x);
	if x<0 then
		x := x*-1;
	writeln('El valor absoluto de ', x, ' es: ', x);
 end.
