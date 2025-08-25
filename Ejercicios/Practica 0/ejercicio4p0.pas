{
Implemente un programa que lea el diámetro D de un circulo e imprima:
a. El radio (R) del circulo (la mitad del diametro)
b. El area del circulo. Para calcular el área de un círculo debe utilizar la fórmula PI x R^2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula 
	D*PI (o también PI*R*2).
}

program ej04p0;
const
	pi = 3.1415926535;
var
	area,perimetro,diametro,radio: real;
begin
	writeln('Ingrese diametro del circulo');
	readln(diametro);
	
	radio := (diametro/2);
	area := (pi * (radio * radio));
	perimetro := (diametro * pi);
	
	writeln('Radio del circulo: ', radio);
	writeln ('Area del circulo: ', area);
	writeln ('Perimetro del circulo: ', perimetro);
end.
