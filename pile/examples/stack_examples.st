PROGRAM stack_examples
VAR
	success	: BOOL;
	value : INT;
END_VAR

==========================================================================================================================

// Ajout d'une valeurs sur la pile
IF empiler_btn THEN
	success := my_stack.PUSH(element_value);
	empiler_btn := FALSE;
END_IF

// Retirer une valeur
IF depiler_btn THEN
	value := my_stack.POP();
	depiler_btn := FALSE;
END_IF;