; bbs interpretation x86
; ASC sort unsorted address range

;  (ptr, len)
bbs(INT*, INT):
        PUSH    RBP
        MOV     RBP, RSP
        MOV     QWORD PTR [RBP-24], RDI
        MOV     DWORD PTR [RBP-28], ESI
        MOV     DWORD PTR [RBP-4], 0 		; i = 0
L6:						; i&j loop. repeat j-loop(length^2 - i)
        MOV     EAX, DWORD PTR [RBP-4]
        CMP     EAX, DWORD PTR [RBP-28]
        JGE     L7
        MOV     DWORD PTR [RBP-8], 0 		; j = 0
L5:
        MOV     EAX, DWORD PTR [RBP-28]
        SUB     EAX, DWORD PTR [RBP-4]
        CMP     DWORD PTR [RBP-8], EAX
        JGE     L3
        MOV     EAX, DWORD PTR [RBP-8]		; if left > right
        CDQE
        LEA     RDX, [0+RAX*4]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RDX
        MOV     EDX, DWORD PTR [RAX]
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        ADD     RAX, 1
        LEA     RCX, [0+RAX*4]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RCX
        MOV     EAX, DWORD PTR [RAX]
        CMP     EDX, EAX
        JLE     L4				; execute swap
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        LEA     RDX, [0+RAX*4]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RDX
        MOV     EAX, DWORD PTR [RAX]
        MOV     DWORD PTR [RBP-12], EAX
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        ADD     RAX, 1
        LEA     RDX, [0+RAX*4]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RDX
        MOV     EDX, DWORD PTR [RBP-8]
        MOVSX   RDX, EDX
        LEA     RCX, [0+RDX*4]
        MOV     RDX, QWORD PTR [RBP-24]
        ADD     RDX, RCX
        MOV     EAX, DWORD PTR [RAX]
        MOV     DWORD PTR [RDX], EAX
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        ADD     RAX, 1
        LEA     RDX, [0+RAX*4]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RDX, RAX
        MOV     EAX, DWORD PTR [RBP-12]
        MOV     DWORD PTR [RDX], EAX
L4:
        ADD     DWORD PTR [RBP-8], 1
        JMP     L5
L3:
        ADD     DWORD PTR [RBP-4], 1
        JMP     L6
L7:
        NOP
        POP     RBP
        RET
LC0:
        STRING "OUTPUT: "
LC1:
        STRING "%d "
main:
        PUSH    RBP
        MOV     RBP, RSP
        SUB     RSP, 64				; int unsorted { 6, 2, 9, 1, 5, 7, 4, 1, 3, 8 } : 10
        MOV     DWORD PTR [RBP-64], 6
        MOV     DWORD PTR [RBP-60], 2
        MOV     DWORD PTR [RBP-56], 9
        MOV     DWORD PTR [RBP-52], 1
        MOV     DWORD PTR [RBP-48], 5
        MOV     DWORD PTR [RBP-44], 7
        MOV     DWORD PTR [RBP-40], 4
        MOV     DWORD PTR [RBP-36], 1
        MOV     DWORD PTR [RBP-32], 3
        MOV     DWORD PTR [RBP-28], 8
        LEA     RAX, [RBP-64]
        MOV     QWORD PTR [RBP-16], RAX
        MOV     RAX, QWORD PTR [RBP-16]
        MOV     ESI, 10 			; sizeof(unsorted)
        MOV     RDI, RAX
        CALL    bbs(INT*, INT)
        MOV     EDI, OFFSET FLAT:LC0
        MOV     EAX, 0
        CALL    PRINTF
        MOV     DWORD PTR [RBP-4], 0
L10:   						; output
        MOV     EAX, DWORD PTR [RBP-4]
        CDQE
        CMP     RAX, 9
        JA      L9
        MOV     EAX, DWORD PTR [RBP-4]
        CDQE
        LEA     RDX, [0+RAX*4]
        MOV     RAX, QWORD PTR [RBP-16]
        ADD     RAX, RDX
        MOV     EAX, DWORD PTR [RAX]
        MOV     ESI, EAX
        MOV     EDI, OFFSET FLAT:LC1            ; printf("%d")
        MOV     EAX, 0
        CALL    PRINTF
        ADD     DWORD PTR [RBP-4], 1
        JMP     L10
L9:
        MOV     EAX, 0
        LEAVE
        RET
