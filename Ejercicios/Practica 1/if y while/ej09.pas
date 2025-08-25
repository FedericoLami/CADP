{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
 carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
 una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
 con la secuencia de números, e imprimir el resultado final.
 Por ejemplo:
 ○ Si se lee el carácter “-” y la secuencia 4   3   5  -6  0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
 ○ Si se lee el carácter “+” y la secuencia -10  5  6  -1  0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}
 
 //NO SE RESUELVE SEGUN LOS CRITERIOS DE LA CATEDRA DE CADP 
program ej09;
const
  suma = '+';
  resta = '-';
  fin = 0;
var
  num, resultado: integer;
  dig, secu, txtNum: string;
begin
  resultado := 0;
  secu := '';
  readln(dig);
  
  if (dig[1] = suma) or (dig[1] = resta) then
  begin
    readln(num);
    
    if num <> 0 then
    begin
      Str(num, txtNum);
      secu := secu + txtNum;
    end;
    
    while num <> 0 do
    begin
      if dig[1] = suma then
        resultado := resultado + num
      else
        resultado := resultado - num;
        
      Str(num, txtNum);			//NO SE PERMITE USAR, SOLO SE USO EN ESTE EJERCICIO
      secu := secu + dig[1] + txtNum;
      readln(num);
    end;
    
    writeln('El resultado de la operacion: ', secu, ' es: ', resultado);
  end
  else
    writeln('Error, no se ingreso un carácter correcto');
end.
