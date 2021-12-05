.MODEL
.STACK 100H
.DATA
    equation_display DB 'EQUATION A=5*A-7','$'
    MSG DB 'ENTER THE VALUE OF A: ','$'
    result DB 'RESULT: ','$'
.CODE

MAIN PROC
    
    MOV BX,@DATA
    MOV DS,BX
    
    MOV AH,9H
    MOV DX,OFFSET equation_display
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9H
    MOV DX,OFFSET MSG
    INT 21H
    
    MOV AH,1 
    INT 21H
          
    MOV BL,5      
    MUL BL
    SUB AX,7
    PUSH AX
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9H
    MOV DX,OFFSET result
    INT 21H
    
    POP AX
    MOV DX,AX
    SUB DX,192
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN