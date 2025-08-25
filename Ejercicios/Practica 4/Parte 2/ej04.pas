{
Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
 alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
 nro de alumno de manera ascendente. Se pide:
 a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
 alumno seguro existe.
 b. Un módulo que reciba un alumno y lo inserte en el vector.
 c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
 d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
 e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
 Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
 leídos de teclado.
}
program ej04;
const
    dimf = 1000;
type
    cadena = string[50];
    alumno = record
        nro: integer;
        ape: cadena;
        nom: cadena;
        asist: integer;
    end;
    vector = array [1..dimf] of alumno;

procedure cargaRegistro(var a: alumno);
begin
    with a do begin
        readln(nro);
        if nro <> 0 then begin
            readln(ape);
            readln(nom);
            readln(asist);
        end;
    end;
end;

procedure cargaVector(var v: vector; var diml: integer);
var
    a: alumno;
begin
    diml := 0;
    cargaRegistro(a);
    while (diml < dimf) and (a.nro <> 0) do begin
        diml := diml + 1;
        v[diml] := a;
        cargaRegistro(a);
    end;
end;

function retornaPosicion(v: vector; diml, parametro: integer): integer;
var
    pos: integer;
begin
    pos := 1;
    while (pos <= diml) and (v[pos].nro <> parametro) do
        pos := pos + 1;
    retornaPosicion := pos; // El enunciado dice que el alumno seguro existe
end;

procedure insertar(var v: vector; var diml: integer; a: alumno);
var
    i, pos: integer;
begin
    if diml < dimf then begin
        pos := 1;
        while (pos <= diml) and (a.nro > v[pos].nro) do
            pos := pos + 1;
        for i := diml downto pos do
            v[i+1] := v[i];
        v[pos] := a;
        diml := diml + 1;
    end;
end;

procedure eliminar(var v: vector; var diml: integer; pos: integer);
var
    i: integer;
begin
    for i := pos to diml - 1 do
        v[i] := v[i+1];
    diml := diml - 1;
end;

procedure eliminarPorNro(var v: vector; var diml: integer; nro: integer);
var
    pos: integer;
begin
    pos := retornaPosicion(v, diml, nro);
    eliminar(v, diml, pos);
end;

procedure eliminarAsistCero(var v: vector; var diml: integer);
var
    pos: integer;
begin
    pos := 1;
    while pos <= diml do begin
        if v[pos].asist = 0 then
            eliminar(v, diml, pos)
        else
            pos := pos + 1;
    end;
end;

var
    v: vector;
    diml, nro: integer;
    a: alumno;
begin
    cargaVector(v, diml);

    readln(nro);
    writeln('Posicion del alumno: ', retornaPosicion(v, diml, nro));

    cargaRegistro(a);
    insertar(v, diml, a);

    readln(nro);
    eliminarPorNro(v, diml, nro);

    eliminarAsistCero(v, diml);
end.
