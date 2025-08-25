{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
 ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído}
  //NO SE RESUELVE SEGUN LOS CRITERIOS DE LA CATEDRA DE CADP
program ej4;
var
	x,num:real;
begin
	readln(x);
	num:=x;
	while x <> num*2 do
		readln(x);
end.
