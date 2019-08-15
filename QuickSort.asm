; amd64
; quicksort interpretation

; ASC sort an array
SWAP:
        PUSH    RBP
        MOV     RBP, RSP
        MOV     QWORD PTR [RBP-24], RDI
        MOV     DWORD PTR [RBP-28], ESI
        MOV     DWORD PTR [RBP-32], EDX
        MOV     EAX, DWORD PTR [RBP-28]
        CDQE
        LEA     RDX, [0+RAX*8]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RDX
        MOV     RAX, QWORD PTR [RAX]
        MOV     DWORD PTR [RBP-4], EAX
        MOV     EAX, DWORD PTR [RBP-28]
        CDQE
        LEA     RDX, [0+RAX*8]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RDX, RAX
        MOV     EAX, DWORD PTR [RBP-32]
        CDQE
        LEA     RCX, [0+RAX*8]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RCX
        MOV     RAX, QWORD PTR [RAX]
        MOV     QWORD PTR [RDX], RAX
        MOV     EAX, DWORD PTR [RBP-32]
        CDQE
        LEA     RDX, [0+RAX*8]
        MOV     RAX, QWORD PTR [RBP-24]
        ADD     RAX, RDX
        MOV     EDX, DWORD PTR [RBP-4]
        MOVSX   RDX, EDX
        MOV     QWORD PTR [RAX], RDX
        POP     RBP
        RET
PARTITION:
        PUSH    RBP
        MOV     RBP, RSP
        SUB     RSP, 40
        MOV     QWORD PTR [RBP-24], RDI
        MOV     DWORD PTR [RBP-28], ESI
        MOV     DWORD PTR [RBP-32], EDX
        MOV     DWORD PTR [RBP-36], ECX
        MOV     RAX, QWORD PTR [RBP-24]
        MOV     EDX, DWORD PTR [RBP-28]
        MOVSX   RDX, EDX
        SAL     RDX, 3
        ADD     RAX, RDX
        MOV     RAX, QWORD PTR [RAX]
        MOV     DWORD PTR [RBP-12], EAX
        MOV     EAX, DWORD PTR [RBP-32]
        MOV     DWORD PTR [RBP-4], EAX
        MOV     EAX, DWORD PTR [RBP-32]
        MOV     DWORD PTR [RBP-8], EAX
        JMP     .L3
.L5:
        MOV     RAX, QWORD PTR [RBP-24]
        MOV     EDX, DWORD PTR [RBP-8]
        MOVSX   RDX, EDX
        SAL     RDX, 3
        ADD     RAX, RDX
        MOV     RAX, QWORD PTR [RAX]
        MOV     EDX, DWORD PTR [RBP-12]
        MOVSX   RDX, EDX
        CMP     RAX, RDX
        JNB     .L4
        MOV     EDX, DWORD PTR [RBP-4]
        MOV     ECX, DWORD PTR [RBP-8]
        LEA     RAX, [RBP-24]
        MOV     ESI, ECX
        MOV     RDI, RAX
        CALL    SWAP
        ADD     DWORD PTR [RBP-4], 1
.L4:
        ADD     DWORD PTR [RBP-8], 1
.L3:
        MOV     EAX, DWORD PTR [RBP-8]
        CMP     EAX, DWORD PTR [RBP-36]
        JL      .L5
        MOV     EDX, DWORD PTR [RBP-4]
        MOV     ECX, DWORD PTR [RBP-36]
        LEA     RAX, [RBP-24]
        MOV     ESI, ECX
        MOV     RDI, RAX
        CALL    SWAP
        MOV     EAX, DWORD PTR [RBP-4]
        LEAVE
        RET
QS:
        PUSH    RBP
        MOV     RBP, RSP
        SUB     RSP, 32
        MOV     QWORD PTR [RBP-24], RDI
        MOV     DWORD PTR [RBP-28], ESI
        MOV     DWORD PTR [RBP-32], EDX
        MOV     DWORD PTR [RBP-4], 8
        MOV     EAX, DWORD PTR [RBP-28]
        CMP     EAX, DWORD PTR [RBP-32]
        JGE     .L8
        MOV     EAX, DWORD PTR [RBP-32]
        MOV     DWORD PTR [RBP-8], EAX
        MOV     ECX, DWORD PTR [RBP-32]
        MOV     EDX, DWORD PTR [RBP-28]
        MOV     ESI, DWORD PTR [RBP-8]
        LEA     RAX, [RBP-24]
        MOV     RDI, RAX
        CALL    PARTITION
        MOV     DWORD PTR [RBP-12], EAX
        MOV     EAX, DWORD PTR [RBP-12]
        LEA     EDX, [RAX-1]
        MOV     ECX, DWORD PTR [RBP-28]
        LEA     RAX, [RBP-24]
        MOV     ESI, ECX
        MOV     RDI, RAX
        CALL    QS
        MOV     EAX, DWORD PTR [RBP-12]
        LEA     ECX, [RAX+1]
        MOV     EDX, DWORD PTR [RBP-32]
        LEA     RAX, [RBP-24]
        MOV     ESI, ECX
        MOV     RDI, RAX
        CALL    QS
.L8:
        LEA     RAX, [RBP-24]
        LEAVE
        RET
MAIN:
        PUSH    RBP
        MOV     RBP, RSP
        SUB     RSP, 16
        MOV     QWORD PTR [RBP-8], 0
        MOV     RAX, QWORD PTR [RBP-8]
        MOV     EDX, 0
        MOV     ESI, 0
        MOV     RDI, RAX
        CALL    QS
        LEAVE
        RET
