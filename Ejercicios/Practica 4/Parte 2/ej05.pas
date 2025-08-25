{
 La empresa Amazon WebServices (AWS) dispone de la información de sus 500 clientes monotributistas más
 grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
 monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
 el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
 contrato (los más antiguos primero, los más recientes últimos).
 Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
 Una vez almacenados los datos, procesar dicha estructura para obtener:
 a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
 b. Cantidad de clientes para cada categoría de monotributo
 c. Código de las 10 ciudades con mayor cantidad de clientes
 d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes
}
program ej05;
const
    dimf = 500;
    maxCat = 6; 
    maxCiudad = 2400;
type
    cadena = string[50];
    rangoCat = 1..maxCat;
    rangoCiudad = 1..maxCiudad;

    fecha = record
        dia: integer;
        mes: integer;
        anio: integer;
    end;

    cliente = record
        f: fecha;
        cat: rangoCat;
        ciudad: rangoCiudad;
        monto: real;
    end;

    vectorClientes = array[1..dimf] of cliente;
    vectorCategorias = array[rangoCat] of integer;
    vectorCiudades = array[rangoCiudad] of integer;

procedure cargaFecha(var f: fecha);
begin
    readln(f.dia);
    readln(f.mes);
    readln(f.anio);
end;

procedure cargaCliente(var c: cliente);
var
    letra: char;
begin
    cargaFecha(c.f);
    readln(letra);
    c.cat := ord(letra) - ord('A') + 1; 
    readln(c.ciudad);
    readln(c.monto);
end;

procedure cargaVector(var v: vectorClientes; var diml: integer);
var
    c: cliente;
begin
    diml := 0;
    cargaCliente(c);
    while (diml < dimf) and (c.f.anio <> 0) do begin
        diml := diml + 1;
        v[diml] := c;
        cargaCliente(c);
    end;
end;

procedure contratosPorMesYAnio(v: vectorClientes; diml: integer);
var
    i, anioMax, cantMax: integer;
    actualAnio, contAnio: integer;
    contratosMes: array[1..12] of integer;
begin
    for i := 1 to 12 do
        contratosMes[i] := 0;
    actualAnio := v[1].f.anio;
    contAnio := 0;
    cantMax := -1;
    anioMax := actualAnio;

    for i := 1 to diml do begin
        contratosMes[v[i].f.mes] := contratosMes[v[i].f.mes] + 1;

        if v[i].f.anio = actualAnio then
            contAnio := contAnio + 1
        else begin
            if contAnio > cantMax then begin
                cantMax := contAnio;
                anioMax := actualAnio;
            end;
            actualAnio := v[i].f.anio;
            contAnio := 1;
        end;
    end;

    if contAnio > cantMax then begin
        cantMax := contAnio;
        anioMax := actualAnio;
    end;

    writeln('Cantidad de contratos por mes:');
    for i := 1 to 12 do
        writeln('Mes ', i, ': ', contratosMes[i]);

    writeln('Año con más contratos: ', anioMax, ' con ', cantMax, ' contratos');
end;

procedure clientesPorCategoria(v: vectorClientes; diml: integer);
var
    i: integer;
    vc: vectorCategorias;
begin
    for i := 1 to maxCat do
        vc[i] := 0;

    for i := 1 to diml do
        vc[v[i].cat] := vc[v[i].cat] + 1;

    writeln('Cantidad de clientes por categoría:');
    for i := 1 to maxCat do
        writeln('Categoría ', chr(i + ord('A') - 1), ': ', vc[i]);
end;

procedure top10Ciudades(v: vectorClientes; diml: integer);
var
    i, j, maxPos, auxCod, auxCant: integer;
    vc: vectorCiudades;
    codigos: array[1..maxCiudad] of integer;
begin
    for i := 1 to maxCiudad do begin
        vc[i] := 0;
        codigos[i] := i;
    end;

    for i := 1 to diml do
        vc[v[i].ciudad] := vc[v[i].ciudad] + 1;

    for i := 1 to maxCiudad - 1 do begin
        maxPos := i;
        for j := i + 1 to maxCiudad do
            if vc[j] > vc[maxPos] then
                maxPos := j;

        auxCant := vc[i];
        vc[i] := vc[maxPos];
        vc[maxPos] := auxCant;

        auxCod := codigos[i];
        codigos[i] := codigos[maxPos];
        codigos[maxPos] := auxCod;
    end;

    writeln('Top 10 ciudades con más clientes:');
    for i := 1 to 10 do
        writeln('Ciudad ', codigos[i], ' con ', vc[i], ' clientes');
end;

procedure clientesSobrePromedio(v: vectorClientes; diml: integer);
var
    i, cant: integer;
    suma, promedio: real;
begin
    suma := 0;
    for i := 1 to diml do
        suma := suma + v[i].monto;

    promedio := suma / diml;
    cant := 0;

    for i := 1 to diml do
        if v[i].monto > promedio then
            cant := cant + 1;

    writeln('Promedio: ', promedio:0:2);
    writeln('Clientes sobre el promedio: ', cant);
end;

var
    v: vectorClientes;
    diml: integer;
begin
    cargaVector(v, diml);
    contratosPorMesYAnio(v, diml);
    clientesPorCategoria(v, diml);
    top10Ciudades(v, diml);
    clientesSobrePromedio(v, diml);
end.
