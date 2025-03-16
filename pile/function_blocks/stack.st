FUNCTION_BLOCK stack

VAR CONSTANT
	MAX_SIZE :		INT							:= 10;		// Taille maximale de la pile
END_VAR

VAR
	stackArray : 	ARRAY[1..MAX_SIZE] OF INT	;			// Tableau pour stocker les éléments
	top :			INT							:= 0; 		// Indice du sommet de la pile
	errorCode :		INT							:= 0;		// Code d'erreur : 0 -> OK, 1 -> Overflow (Débordement), 2 -> Underflow (Vide)
END_VAR

==========================================================================================================================

METHOD PEEK : INT

PEEK := 0;
errorCode := 0; 	// Réinitialisation du code d'erreur.

IF top > 0 THEN
    PEEK := stackArray[top];
ELSE
    errorCode := 2; // Erreur : Pile vide (Underflow)
END_IF;

==========================================================================================================================

METHOD POP : INT

POP := 0;
errorCode := 0; 	// Réinitialisation du code d'erreur.

IF top > 0 THEN
	POP := stackArray[top];
	top := top - 1;
ELSE
	errorCode := 2;	// Erreur : Pile vide (Underflow).
END_IF

==========================================================================================================================

METHOD PUSH : BOOL
VAR_INPUT
	value	: INT;
END_VAR

PUSH := FALSE;
errorCode := 0;		// Réinitialisation du code d'erreur.

IF top < MAX_SIZE THEN
	top := top + 1;
	stackArray[top] := value;
	PUSH := TRUE;
ELSE
	errorCode := 1;	// Erreur : Dépassement de la pile (Overflow).
END_IF

==========================================================================================================================

PROPERTY is_empty : BOOL
is_empty := top = 0;

==========================================================================================================================

PROPERTY is_full : BOOL
is_full := top = MAX_SIZE;

