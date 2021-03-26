/*
-------------------------------------------------------
l02_t03.s
Copies contents of one vector to another.
-------------------------------------------------------
Author:  Nish Tewari 
ID:      190684430
Email:   tewa4430@mylaurier.ca
Date:    2021-01-28
-------------------------------------------------------
*/
.org	0x1000	// Start at memory location 1000
.text  // Code section
.global _start
_start:

.text	                
// Copy contents of first element of Vec1 to Vec2
  LDR	    R0, =Vec1
  LDR	    R1, =Vec2
  LDR   	R2, [R0]
  STR	    R2, [R1]
// Copy contents of second element of Vec1 to Vec2
  ADD	    R0, R0, #4  // Changed from #2 to #4 
  ADD	    R1, R1, #4  // Changed from #2 to #4 
  LDR	    R2, [R0]
  STR	    R2, [R1]
// Copy contents of second element of Vec1 to Vec2
  ADD	    R0, R0, #4  // Changed R1 to R0 
  ADD	    R1, R1, #4
  LDR	    R2, [R0]
  STR	    R2, [R1]    // Changed R2 to R1

// End program
_stop:
B _stop

// Initialized data section
.data	

Vec1:	.word	1, 2, 3

.bss	              // Uninitialized data section

Vec2:	.space	6
.end
