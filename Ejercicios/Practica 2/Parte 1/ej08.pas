{
a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto
puede traer problemas en el código del programa principal.

i) ¿qué clase de problema encuentra?
El programa principal no reconoce la funcion analizarLetra dado que su alcance solo llega a el procedimiento leer.

ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
Extrayendo la funcion analizar letra por fuera del procedimiento leer, para que su alcance sea global.

b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?
Se trata de letras con carácteres especiales.

ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
Arrojaría un error de ejecucion y terminaría el programa inmediatamente

iii) ¿Cómo se puede resolver este problema?
Generando mas comparaciones para que estas letras con caracteres especiales no queden fuera.
}

program anidamientos;

procedure leer;
var
letra : char;

function analizarLetra : boolean
begin
	if (letra >= ‘a’) and (letra <= ‘z’) then
	analizarLetra := true;
	else
	if (letra >= ‘A’) and (letra <= ‘Z’) then
	analizarletra := false;
end; { fin de la funcion analizarLetra }

begin
	readln(letra);
	if (analizarLetra) then
	writeln(‘Se trata de una minúscula’)
	else
	writeln(‘Se trata de una mayúscula’);
end; { fin del procedure leer}

var
ok : boolean;
begin
{ programa principal }
leer;
ok := analizarLetra;
if ok then
writeln(‘Gracias, vuelva prontosss’);
end.
