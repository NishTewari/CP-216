/*
-------------------------------------------------------
l03_t02.s
A simple count down program (BGE)
-------------------------------------------------------
Author:  Nish Tewari 
ID:      190684430
Email:   tewa4430@mylaurier.ca
Date:    2021-02-01
-------------------------------------------------------
*/
.org	0x1000	// Start at memory location 1000
.text         // Code section
.global _start
_start:

// Store data in registers
LDR	    R2, =COUNTER		 // Initialize a countdown value
LDR     R3, [R2]       // Storing contents of R2 in R3

TOP:
SUB	    R3, R3, #1	    // Decrement the countdown value
CMP	    R3, #0		       // Compare the countdown value to 0
BGE	    TOP			         // Branch to top under certain conditions

// End program 
_stop:
B	_stop


 @define the data section 
.data

COUNTER: .word 5

.end 
