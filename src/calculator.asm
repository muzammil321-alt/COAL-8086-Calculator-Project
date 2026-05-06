; ************************************************************
; Project: Simple 1-Digit Calculator (ORG 100h Format)
; Author: Muhammed Muzammil (Muzi)
; ************************************************************

ORG 100h

JMP START          ; Data area ko skip karke code par jane ke liye

; --- DATA SECTION ---
msg1 DB 'Enter First Digit: $'
msg2 DB 13, 10, 'Enter Second Digit: $'
res  DB 13, 10, 'The Result is: $'
err  DB 13, 10, 'Error: Sirf 0-9 use karein! $'

START:
    ; --- Step 1: Get First Number ---
    MOV DX, OFFSET msg1
    MOV AH, 09H          ; Display String
    INT 21H

    MOV AH, 01H          ; Get Input (ASCII)
    INT 21H
    
    ; ERROR HANDLING
    CMP AL, '0'
    JB  INVALID          
    CMP AL, '9'
    JA  INVALID          
    
    SUB AL, 30H          ; ASCII to number
    MOV BL, AL           ; Store in BL Register

    ; --- Step 2: Get Second Number ---
    MOV DX, OFFSET msg2
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    
    CMP AL, '0'
    JB  INVALID
    CMP AL, '9'
    JA  INVALID
    
    SUB AL, 30H          
    
    ; --- Step 3: ALU Operation (Addition) ---
    ADD AL, BL           
    MOV BL, AL           

    ; --- Step 4: Display Result ---
    MOV DX, OFFSET res
    MOV AH, 09H
    INT 21H

    MOV DL, BL           
    ADD DL, 30H          ; Number to ASCII
    MOV AH, 02H          ; Display Result
    INT 21H

    RET                  ; Program Finish (COM format mein RET use hota hai)

INVALID:
    MOV DX, OFFSET err
    MOV AH, 09H
    INT 21H
    RET                  ; Exit on error

END
