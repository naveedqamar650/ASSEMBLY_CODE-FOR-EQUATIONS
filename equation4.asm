.MODEL
.STACK 100H
.DATA
    MSG1 DB 'ENTER THE VALUE OF A: ','$'  
    MSG2 DB 'ENTER THE VALUE OF B: ','$'
    MSG3 DB 'ENTER THE VALUE OF C: ','$'
    
    result DB 'RESULT: ','$'
.CODE

MAIN PROC
    
    MOV BX,@DATA
    MOV DS,BX
    
    MOV AH,9H
    MOV DX,OFFSET MSG1
    INT 21H
    
    MOV AH,1 
    INT 21H   
    XOR BX,BX
    SUB AL,30H
    MOV BL,AL
    
    MOV AH,9H
    MOV DX,OFFSET MSG2
    INT 21H
    
    MOV AH,1 
    INT 21H
    XOR CX,CX
    SUB AL,30H
    MOV CL,AL
    
    MOV AH,9H
    MOV DX,OFFSET MSG3
    INT 21H
    
    MOV AH,1 
    INT 21H
    XOR DX,DX
    SUB AL,30H
    MOV DL,AL 
    
    XOR AX,AX
    MOV AL,BL
    MUL BL
    MOV BL,AL
    
    XOR AX,AX
    MOV AL,CL
    MUL CL
    MOV CL,AL
    
    XOR AX,AX
    MOV AL,DL
    MUL DL
    MOV DL,AL
               
    ADD BL, CL
    CMP BL,DL
    JNE NEXT
        STC
    NEXT:
        CLC                   
               
    MAIN ENDP

END MAIN