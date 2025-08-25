{
Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.

a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para si mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60 (hace 500 años)
}
program ej05p0;
const
	precio = 1.60;
var
	total,sobran,x,y:integer;
begin
	writeln('Ingresar cantidad de clientes');
	readln(y);
	writeln('Ingresar cantidad de caramelos');
	readln(x);
	
	sobran := (x mod y);
	total := (x div y);
	
	writeln('La cantidad de caramelos que corresponde a cada uno son: ', total);
	writeln('La cantidad de caramelos que sobran son: ', sobran);
	writeln('El total que debe cobrar el kiosquero es de: ', (x*precio));
end.
