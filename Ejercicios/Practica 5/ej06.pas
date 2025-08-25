{
Realizar un programa que ocupe 50 KB de memoria en total. Para ello: 
a) El programa debe utilizar sólo memoria estática
b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica 
c) El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4 bytes)
}

program MemoriaEstatica;
type
  TVector = array[1..25600] of Integer; { 25.600 * 2 bytes = 51.200 bytes }
var
  v: TVector;
begin
  writeln('Programa con 50 KB en memoria estatica.');
end.

program MemoriaMixta;
type
  TVector = array[1..12800] of Integer; { 12.800 * 2 bytes = 25 KB }
  PVector = ^TVector;                   { puntero: 4 bytes }
var
  v: TVector;
  pv: PVector;
begin
  new(pv); { reserva otros 25 KB en memoria dinámica }
  writeln('Programa con 25 KB estatica y 25 KB dinamica.');
  dispose(pv);
end.

program MemoriaDinamica;
type
  PVector = ^array[1..25598] of Integer; { 25.598 * 2 bytes ≈ 50 KB }
var
  pv: PVector; { 4 bytes estáticos }
begin
  new(pv); { reserva el resto en heap }
  writeln('Programa con maximo 4 bytes estaticos y el resto dinamico.');
  dispose(pv);
end.
