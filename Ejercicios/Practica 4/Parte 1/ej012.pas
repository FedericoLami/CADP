program galaxias;
const
  dimf = 53;
type
  str20 = string[20];
  rangoTipo = 1..4;
  galaxia = record
    nombre: str20;
    tipo: rangoTipo;
    masa: real;
    distancia: real;
  end;
  vector = array[1..dimf] of galaxia;

procedure cargaVector(var v:vector; var diml:integer);
var
  g:galaxia;
begin
  diml := 0;
  while diml < dimf do
  begin
    writeln('Nombre de la galaxia:');
    readln(g.nombre);
    writeln('Tipo (1 eliptica, 2 espiral, 3 lenticular, 4 irregular):');
    readln(g.tipo);
    writeln('Masa (kg):');
    readln(g.masa);
    writeln('Distancia (pc):');
    readln(g.distancia);

    diml := diml + 1;
    v[diml] := g;
  end;
end;

procedure contarTipos(v:vector; diml:integer; var c1,c2,c3,c4:integer);
var
  i:integer;
begin
  c1:=0; c2:=0; c3:=0; c4:=0;
  for i:=1 to diml do
  begin
    case v[i].tipo of
      1: c1 := c1 + 1;
      2: c2 := c2 + 1;
      3: c3 := c3 + 1;
      4: c4 := c4 + 1;
    end;
  end;
end;

procedure masaTresPrincipales(v:vector; diml:integer; var masaTotal:real; var porcentaje:real);
var
  i:integer;
  masaTodas:real;
begin
  masaTotal := 0;
  masaTodas := 0;
  for i:=1 to diml do
  begin
    masaTodas := masaTodas + v[i].masa;
    if (v[i].nombre = 'Via Lactea') or (v[i].nombre = 'Andromeda') or (v[i].nombre = 'Triangulo') then
      masaTotal := masaTotal + v[i].masa;
  end;
  porcentaje := (masaTotal * 100) / masaTodas;
end;

procedure contarNoIrregularesCerca(v:vector; diml:integer; var cant:integer);
var
  i:integer;
begin
  cant := 0;
  for i:=1 to diml do
    if (v[i].tipo <> 4) and (v[i].distancia < 1000) then
      cant := cant + 1;
end;

procedure dosMayoresYDosMenores(v:vector; diml:integer; var max1,max2,min1,min2:galaxia);
var
  i:integer;
begin
  max1 := v[1]; max2 := v[1];
  min1 := v[1]; min2 := v[1];

  for i:=2 to diml do
  begin
    if v[i].masa > max1.masa then
    begin
      max2 := max1;
      max1 := v[i];
    end
    else if v[i].masa > max2.masa then
      max2 := v[i];

    if v[i].masa < min1.masa then
    begin
      min2 := min1;
      min1 := v[i];
    end
    else if v[i].masa < min2.masa then
      min2 := v[i];
  end;
end;

procedure informarResultados(c1,c2,c3,c4:integer; masaTotal,porcentaje:real; cantNoIrreg:integer; max1,max2,min1,min2:galaxia);
begin
  writeln('Cantidad por tipo:');
  writeln('Elipticas: ', c1);
  writeln('Espirales: ', c2);
  writeln('Lenticulares: ', c3);
  writeln('Irregulares: ', c4);

  writeln;
  writeln('Masa total de las 3 principales: ', masaTotal:0:2, ' kg');
  writeln('Porcentaje respecto al total: ', porcentaje:0:2, '%');

  writeln;
  writeln('Cantidad de galaxias no irregulares a menos de 1000 pc: ', cantNoIrreg);

  writeln;
  writeln('Dos galaxias con mayor masa: ', max1.nombre, ' y ', max2.nombre);
  writeln('Dos galaxias con menor masa: ', min1.nombre, ' y ', min2.nombre);
end;

var
  v:vector;
  diml:integer;
  c1,c2,c3,c4:integer;
  masaTotal,porcentaje:real;
  cantNoIrreg:integer;
  max1,max2,min1,min2:galaxia;
begin
  cargaVector(v,diml);
  contarTipos(v,diml,c1,c2,c3,c4);
  masaTresPrincipales(v,diml,masaTotal,porcentaje);
  contarNoIrregularesCerca(v,diml,cantNoIrreg);
  dosMayoresYDosMenores(v,diml,max1,max2,min1,min2);
  informarResultados(c1,c2,c3,c4,masaTotal,porcentaje,cantNoIrreg,max1,max2,min1,min2);
end.
