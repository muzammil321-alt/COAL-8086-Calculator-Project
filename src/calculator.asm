# COAL 8086 Calculator Project
This project is a simple 1-digit calculator built using 8086 Assembly Language for the COAL course.

## 1. Problem Analysis
- **CPU Architecture:** 8086 (16-bit)
- **Registers Used:** AX, BL, DX
- **Input:** Single digit (0-9) via keyboard
- **Output:** Arithmetic result displayed on console

## 2. Architecture Design
The project uses a standard Fetch-Decode-Execute cycle.
- **ALU:** Performs addition of two 8-bit values.
- **Control Flow:** Managed via BIOS/DOS interrupts (INT 21H).

## 3. Implementation Details
The source code is written in 8086 Assembly. It includes:
- Input validation to prevent non-numeric characters.
- ASCII to Hex conversion for processing.
- Hex to ASCII conversion for final display.
