; amd64

; ASC sort an array
bbs:
	; int[] unsorted array
        PUSH    RBP
        MOV     RBP, RSP
        MOV     DWORD PTR [RBP-64], 0
        MOV     DWORD PTR [RBP-60], 4
        MOV     DWORD PTR [RBP-56], 1
        MOV     DWORD PTR [RBP-52], 5
        MOV     DWORD PTR [RBP-48], 3
        MOV     DWORD PTR [RBP-44], 8
        MOV     DWORD PTR [RBP-40], 3
        MOV     DWORD PTR [RBP-36], 1
        MOV     DWORD PTR [RBP-32], 3
        MOV     DWORD PTR [RBP-28], 2
        MOV     DWORD PTR [RBP-4], 0
        JMP     .L2
.L6:
        MOV     DWORD PTR [RBP-8], 0
        JMP     .L3
.L5:
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        MOV     EDX, DWORD PTR [RBP-64+RAX*4]
        MOV     EAX, DWORD PTR [RBP-8]
        ADD     EAX, 1
        CDQE
        MOV     EAX, DWORD PTR [RBP-64+RAX*4]
        CMP     EDX, EAX
        JLE     .L4
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        MOV     EAX, DWORD PTR [RBP-64+RAX*4]
        MOV     DWORD PTR [RBP-12], EAX
        MOV     EAX, DWORD PTR [RBP-8]
        ADD     EAX, 1
        CDQE
        MOV     EDX, DWORD PTR [RBP-64+RAX*4]
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        MOV     DWORD PTR [RBP-64+RAX*4], EDX
        MOV     EAX, DWORD PTR [RBP-8]
        ADD     EAX, 1
        CDQE
        MOV     EDX, DWORD PTR [RBP-12]
        MOV     DWORD PTR [RBP-64+RAX*4], EDX
.L4:
        ADD     DWORD PTR [RBP-8], 1
.L3:
        MOV     EAX, DWORD PTR [RBP-8]
        CDQE
        MOV     EDX, DWORD PTR [RBP-4]
        MOVSX   RDX, EDX
        MOV     ECX, 40
        SUB     RCX, RDX
        MOV     RDX, RCX
        CMP     RAX, RDX
        JB      .L5
        ADD     DWORD PTR [RBP-4], 1
.L2:
        MOV     EAX, DWORD PTR [RBP-4]
        CMP     EAX, 39
        JBE     .L6
        NOP
        POP     RBP
        RET
