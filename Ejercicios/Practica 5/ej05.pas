{De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
 interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
 de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
 libres.  Justificar mediante prueba de escritorio.

Momento	Memoria libre
(I) Inicio	400.000 bytes
Tras Readln(alguien.apellido)	400.000 bytes
Tras New(PtrEmpleado)	399.928 bytes
Tras lecturas a través de PtrEmpleado^	399.928 bytes
Tras Dispose(PtrEmpleado)	400.000 bytes}

Program Alocacion_Dinamica;
Type
	TEmpleado = record
	sucursal: char;
	apellido: string[25];
	correoElectrónico: string[40];
	sueldo: real;
end;
	Str50 = string[50];
Var
	alguien: TEmpleado;
	PtrEmpleado: ^TEmpleado;
Begin
	Readln( alguien.apellido );
	New( PtrEmpleado );
	Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
	Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
	Dispose( PtrEmpleado );
end.
