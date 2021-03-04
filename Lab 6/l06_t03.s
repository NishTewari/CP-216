/*
-------------------------------------------------------
sub_read.s
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
Author:  Nish Tewari 
ID:      190684430
Email:   tewa4430@mylaurier.ca
Date:    2021-03-04
-------------------------------------------------------
*/
// Constants
.equ SIZE, 20    	// Size of string buffer storage (bytes)
.text  				    // Code section
.org	0x1000		  // Start at memory location 1000
.global _start
_start:

	MOV    R5, #SIZE
	LDR    R4, =First
	BL	   ReadString
	BL     PrintString
	LDR    R4, =Second
	BL	   ReadString	
	BL     PrintString
	LDR    R4, =Third
	BL     ReadString
	BL     PrintString
	LDR    R4, =Last
	BL     ReadString
	BL     PrintString
    
_stop:
B	_stop

// Subroutine constants
.equ UART_BASE, 0xff201000   // UART base address
.equ VALID, 0x8000			     // Valid data in UART mask
.equ DATA, 0x00FF			       // Actual data in UART mask
.equ ENTER, 0x0A			       // End of line character

ReadString:
/*
-------------------------------------------------------
Reads an ENTER terminated string from the UART.
-------------------------------------------------------
Parameters:
  R4 - address of string buffer
  R5 - size of string buffer
Uses:
  R0 - holds character to print
  R1 - address of UART
-------------------------------------------------------
*/

// your code here
	STMFD 	SP!, {R0 - R1, R4 - R5, LR}
	LDR 	R1, =UART_BASE
	ADD 	R5, R4, R5 
rsLOOP:	
	LDR		R0, [R1] 			  // read the UART data register
	TST 	R0, #VALID	 		// check if there is new data
	BEQ 	_ReadString   	// if no data, return 0
	AND 	R0, R0, #DATA	 	// return the character
	CMP 	R0, #ENTER			// compare character to enter
	BEQ 	_ReadString 		// stop when the enter character is found
	STRB	R0, [R4]		
	ADD		R4, R4, #1	
	CMP		R4, R5	
	BNE 	rsLOOP

_ReadString:
	LDMFD 	SP!, {R0-R1, R4-R5, PC}
	
	
// Subroutine constants
.equ UART_BASE, 0xff201000     // UART base address

PrintString:
/*
-------------------------------------------------------
Prints a null terminated string.
-------------------------------------------------------
Parameters:
  R4 - address of string
Uses:
  R0 - holds character to print
  R1 - address of UART
-------------------------------------------------------
*/
	STMFD  	SP!, {R0-R1, R4, LR}
	LDR 	R1, =UART_BASE

psLOOP:
	LDRB 	R0, [R4], #1   // load a single byte from the string
	CMP  	R0, #0
	BEQ  	_PrintString   // stop when the null character is found
	STR  	R0, [R1]       // copy the character to the UART DATA field
	B    	psLOOP
_PrintString:
	
	mov 	r0, #0x0A    	//Move Enter Key. 
	str 	r0, [r1]		  //Print to UART
	LDMFD   SP!, {R0-R1, R4, PC}

	
.data
.align

// The list of strings
First:	.space  SIZE
Second:	.space	SIZE
Third:	.space	SIZE
Last:	.space	SIZE
_Last:    // End of list address

.end
