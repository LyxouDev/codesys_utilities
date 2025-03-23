PROGRAM queue_examples
VAR
	success	: BOOL;
	value : INT;
END_VAR

==========================================================================================================================

// Ajout d'une valeur dans la file
IF add_file_btn THEN
	success := my_queue.ENQUEUE(element_value);
	add_file_btn := FALSE;
END_IF

// Retirer une valeur
IF sub_file_btn THEN
	value := my_queue.DEQUEUE();
	sub_file_btn := FALSE;
END_IF;