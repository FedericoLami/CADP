{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
 uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
 vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}
  //NO SE RESUELVE SEGUN LOS CRITERIOS DE LA CATEDRA DE CADP
program ej08;
type
	vocales = set of char;
var
	l1,l2,l3:string;
	v:vocales;
begin
	v:=['a','e','i','o','u'];
	writeln('Ingrese 3 letras:');
	writeln('Ingrese letra 1: ');
	readln(l1);
	writeln('Ingrese letra 2: ');
	readln(l2);
	writeln('Ingrese letra 3: ');
	readln(l3);
	
	if (l1[1] in v) and (l2[1] in v) and (l3[1] in v) then
		writeln('Las tres letras son vocales')
	else
	writeln('Al menos un caracter no era vocal');
end.
