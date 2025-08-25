{Dado el siguiente programa:}

program alcanceYFunciones;
var
	suma, cant : integer;

function calcularPromedio : real;
var
	rom : real;
begin
	if (cant = 0) then
		prom := -1
	else
		prom := suma / cant;
	calcularPromedio := prom; //INCISO A: se debe agregar una asignacion de la funcion a un valor para que esta lo retorne.
end;

var
	promedio:real; //PARTE DE INCISO B.
begin { programa principal }
	readln(suma);
	readln(cant);
	promedio := calcularPromedio; //INCISO B: se agrega una asignacion a una variable para no realizar un llamado de la funcion varias veces.
	
	if (promedio <> -1) then begin
		cant := 0;
		writeln(‘El promedio es: ’ , promedio)
	end
	else
		writeln(‘Dividir por cero no parece ser una buena idea’);
end.


//INCISO C: 
- El programa original arroja varios errores, desde faltas de ';' hasta la asignacion de la funcion calcularPromedio a un valor real para su retorno, entre muchos otros.

- El programa luego del inciso A funciona, pero es ineficiente al invocar dos veces la funcion cuando se puede hacer una unica vez, ademas no puede llamarse de esa manera en el writeln, 
   por lo que tambien arrojaria un error.
   
- El programa luego del inciso B funciona correctamente.
