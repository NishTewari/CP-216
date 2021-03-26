/*
-------------------------------------------------------
l02_t01.s
Assign to and add contents of registers.
-------------------------------------------------------
Author:  Nish Tewari 
ID:      190684430
Email:   tewa4430@mylaurier.ca
Date:    2021-01-28
-------------------------------------------------------
*/
.org	0x1000	// Start at memory location 1000
.text         // Code section
.global _start
_start:

// Copy data from memory to registers
LDR		R3, =A  	    //Fixed address syntax - Changed A: to =A
LDR		R0, [R3]
LDR		R3, =B  	    //Fixed address syntax - Changed B; to =B
LDR		R1, [R3]
ADD		R2, R1, R0    // Removed the Square Bracket from R0
LDR		R3, =Result	  // Assign address of Result to R3
STR		R2, [R3]	

// End program
_stop:
B _stop

// Initialized data section
.data	  

A:	.word	4
B:	.word	8
 
.bss	              // Uninitialized data section

Result:	.space 4	  // Set aside 4 bytes for result

.end
