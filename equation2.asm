.MODEL
.STACK 100H
.DATA
    equation_display DB 'EQUATION B=(A-B)*(B+10)','$'
    MSG1 DB 'ENTER THE VALUE OF A: ','$'
    MSG2 DB 'ENTER THE VALUE OF B: ','$'
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
    MOV DX,OFFSET MSG1
    INT 21H
    
    MOV AH,1 
    INT 21H
    
    MOV AH,9H
    MOV DX,OFFSET MSG2
    INT 21H
    
    MOV AH,1 
    INT 21H
    
    MOV AL,MSG1
    MOV BL,MSG2       
    
    SUB AL,BL  
    MOV CL,10H
    ADD BL,CL      
    MUL MSG2
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
    SUB DX,187
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN