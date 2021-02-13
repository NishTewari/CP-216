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
LDR       R1, =UART_BASE
        
LOOP:
LDRB      R0, [R1]    // Load a byte
CMP       R0, #0x0a   // compare if its "Enter"
BEQ       _stop       // If its enter then stop
STRB      R0, [R1]    // Store in uart register
B    LOOP

// End program
_stop:
B    _stop

@define data section
.data  

// Set aside storage for a string
READ_STRING:  .space   SIZE

.end
