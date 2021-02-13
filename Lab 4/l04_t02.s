/*
-------------------------------------------------------
read_string.s
Reads a string from the UART
-------------------------------------------------------
Author:  Nish Tewari 
ID:      190684430
Email:   tewa4430@mylaurier.ca
Date:    2021-02-10
-------------------------------------------------------
*/
// Constants            
.equ UART_BASE, 0xff201000     // UART base address
.equ SIZE, 80                  // Size of string buffer storage (bytes)
.equ VALID, 0x8000             // Valid data in UART mask
.equ ENTER, 0x0a
.org    0x1000                 // Start at memory location 1000
.text  // Code section
.global _start
_start:

// read a string from the UART
LDR     R1, =UART_BASE
LDR     R4, =READ_STRING
LDR     R7, =ENTER
ADD     R5, R4, #SIZE          // store address of end of buffer
        
LOOP:
LDRB    R0, [R1] 		           // Load a single byte
CMP     R0, R7			           // Compare to enter
BEQ     _stop			             // If enter then stop
STRB    R0, [R4]               // store the bytee in memory
ADD     R4, R4, #1             // move to next byte in storage buffer
CMP     R4, R5                 // end program if buffer full
BEQ     _stop
B       LOOP

// End program 
_stop:
B    _stop

@define data section 
.data 

// Set aside storage for a string
READ_STRING:  .space    SIZE

.end
