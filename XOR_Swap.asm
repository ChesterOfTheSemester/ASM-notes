; XOR Swap without the need for a 3rd data unit
swap:
        PUSH    RBP
        MOV     RBP, RSP
        MOV     DWORD PTR [RBP-4], EDI ; arg int x
        MOV     DWORD PTR [RBP-8], ESI ; arg int y
        MOV     EAX, DWORD PTR [RBP-8] ; x XOR y
        XOR     DWORD PTR [RBP-4], EAX
        MOV     EAX, DWORD PTR [RBP-4] ; y XOR x
        XOR     DWORD PTR [RBP-8], EAX
        MOV     EAX, DWORD PTR [RBP-8] ; x XOR y
        XOR     DWORD PTR [RBP-4], EAX
        NOP
        POP     RBP
        RET
