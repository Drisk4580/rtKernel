#pragma once

/*
 * here are UART related functions declared, which then get implemented in Arch/ 
 */

namespace uart {

void initialize(void);

// UART function which don't require interrupts
void putc(char c);
void puts(const char *s);

// UART functions which require interrupts
void iputc(char c);
void iputs(const char *s);

}
