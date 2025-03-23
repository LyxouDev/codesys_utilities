FUNCTION_BLOCK queue
VAR_INPUT
	MAX_SIZE	: INT					:= 5;  // Taille maximale de la file
END_VAR
VAR
	buffer		: ARRAY[0..15] OF INT	;		// Tampon circulaire
	head		: INT					:= 0;	// Index du début
	tail		: INT					:= 0;	// Index de fin
	count		: INT					:= 0;	// Nombre d'éléments
END_VAR

==========================================================================================================================

METHOD ENQUEUE : BOOL
VAR_INPUT
	value	: INT;
END_VAR

IF count < MAX_SIZE THEN
	buffer[tail] := value;
	tail := (tail + 1) MOD MAX_SIZE;
	count := count + 1;
	enqueue := TRUE;
ELSE
	enqueue := FALSE;		// File pleine
END_IF

==========================================================================================================================

METHOD DEQUEUE : INT
VAR_OUTPUT
	success : BOOL;
END_VAR

IF count > 0 THEN
	dequeue := buffer[head];
	head := (head + 1) MOD MAX_SIZE;
	count := count - 1;
	success := TRUE;
ELSE
	success := FALSE;
	dequeue := -1;			// File vide
END_IF

==========================================================================================================================

PROPERTY is_empty : BOOL
is_empty := count = 0;

==========================================================================================================================

PROPERTY is_full : BOOL
is_full := top = MAX_SIZE;

