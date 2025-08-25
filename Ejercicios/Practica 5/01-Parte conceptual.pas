{
1) ¿Qué se define como memoria estática?

	Es la que se reserva en tiempo de compilación y permanece ocupada durante toda la ejecución del programa. 
	Ej.: variables globales, constantes, arreglos con tamaño fijo.

2) ¿Qué se define como memoria dinámica?

	Es la que se reserva en tiempo de ejecución, solo cuando el programa lo necesita, y se libera cuando deja de usarse. 
	Ej.: estructuras creadas con new en Pascal.

3) ¿Qué es una variable de tipo puntero?

	Es una variable que almacena la dirección de otra variable o de un bloque de memoria,
	en lugar de guardar un valor directamente.

4) ¿Qué hace la operación  “NEW” aplicada en una  variable del tipo puntero?

	Reserva un bloque de memoria dinámica para el tipo de dato al que apunta el puntero y devuelve 
su dirección en ese puntero.

5) ¿Qué hace la operación “DISPOSE” aplicada en una variable del tipo puntero?

	Libera la memoria previamente reservada con new para que el sistema la pueda reutilizar.
}
