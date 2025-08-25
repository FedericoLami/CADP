{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c}
program ej03;
const
  dimf = 20;
type
  vector = array [1..dimf] of integer;

procedure cargaVector(var v: vector; var diml: integer);
var
  num: integer;
begin
  readln(num);
  while (num <> 0) and (diml < dimf) do
  begin
    diml := diml + 1;
    v[diml] := num;
    readln(num);
  end;
end;

procedure imprimirEntre(v: vector; x, y: integer);
var
  i: integer;
begin
  if x <= y then
    for i := x to y do
      writeln(v[i])
  else
    for i := x downto y do
      writeln(v[i]);
end;

procedure imprimir(v: vector; diml: integer);
begin
  imprimirEntre(v, 1, diml);
end;

procedure imprimeAtras(v: vector; diml: integer);
begin
  imprimirEntre(v, diml, 1);
end;

procedure imprimeMitad(v: vector; diml: integer);
var
  mitad: integer;
begin
  mitad := diml div 2;
  imprimirEntre(v, mitad, 1);
  writeln('==============');
  imprimirEntre(v, mitad + 1, diml);
end;

var
  v: vector;
  diml: integer;
begin
  diml := 0;
  cargaVector(v, diml);

  writeln('--- a) Imprimir del primero al ultimo ---');
  imprimir(v, diml);

  writeln('--- b) Imprimir del ultimo al primero ---');
  imprimeAtras(v, diml);

  writeln('--- c) Imprimir desde la mitad hacia afuera ---');
  imprimeMitad(v, diml);
end.
