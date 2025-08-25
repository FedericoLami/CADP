{
Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.

}
program ej06;
const
	fin = 0;
type
	cadena = string[50];
	procesador = record
		marca:cadena;
		linea:cadena;
		cores:integer;
		vel:integer;
		tamanio:integer;
	end;

procedure cargaProcesador(var p:procesador);
begin
	readln(p.marca);
	readln(p.cores);	
	if p.cores<>fin then begin
		readln(p.linea);
		readln(p.vel);
		readln(p.tamanio);
	end;
end;

function cumpleCondicionC(marca: cadena; vel, cores: integer): boolean;
begin
  cumpleCondicionC := false;
  if ((marca = 'AMD') or (marca = 'INTEL')) and (cores > 1) and (vel >= 2) then
    cumpleCondicionC := true;
end;

procedure actualizarMaximos(marca: cadena; cantidad: integer;
  var max1, max2: integer; var marca1, marca2: cadena);
begin
  if cantidad > max1 then begin
    max2 := max1;
    marca2 := marca1;
    max1 := cantidad;
    marca1 := marca;
  end
  else if cantidad > max2 then begin
    max2 := cantidad;
    marca2 := marca;
  end;
end;

procedure ejecutar(var marcaMax1, marcaMax2: cadena; var totalMulticoreIntelAMD: integer);
var
  p: procesador;
  marcaActual: cadena;
  cant14nm: integer;
  max1, max2: integer;
begin
  max1 := -1;
  max2 := -1;
  totalMulticoreIntelAMD := 0;

  cargaProcesador(p);
  while p.cores <> fin do begin
    marcaActual := p.marca;
    cant14nm := 0;

    while (p.cores <> fin) and (p.marca = marcaActual) do begin

      if (p.cores > 2) and (p.tamanio <= 22) then begin
        writeln('Marca: ', p.marca, ' | Línea: ', p.linea);
      end;

      if p.tamanio = 14 then
        cant14nm := cant14nm + 1;

      if cumpleCondicionC(p.marca, p.vel, p.cores) then
        totalMulticoreIntelAMD := totalMulticoreIntelAMD + 1;

      cargaProcesador(p);
    end;

    actualizarMaximos(marcaActual, cant14nm, max1, max2, marcaMax1, marcaMax2);
  end;
end;

procedure informar(marca1,marca2:cadena; tot:integer);
begin
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14nm son: ', marca1, ' y ', marca2);
	writeln('El total de procesadores AMD o INTEL que tienen una velocidad mayor a 2GHZ son: ', tot);
end;

var
  marca1, marca2: cadena;
  totalMulticore: integer;
begin
  ejecutar(marca1, marca2, totalMulticore);
  informar(marca1, marca2, totalMulticore);
end.
