; Several ASCII string allocation methods for x86
; Alphabetic char[] "abcdefghijklmnopqrstuvwxyz" : 26


; Alloc by hand
one:
        PUSH    %RBP
        MOV     %RBP, %RSP
        MOV     BYTE PTR [%RBP-32], 97
        MOV     BYTE PTR [%RBP-31], 98
        MOV     BYTE PTR [%RBP-30], 99
        MOV     BYTE PTR [%RBP-29], 100
        MOV     BYTE PTR [%RBP-28], 101
        MOV     BYTE PTR [%RBP-27], 102
        MOV     BYTE PTR [%RBP-26], 103
        MOV     BYTE PTR [%RBP-25], 104
        MOV     BYTE PTR [%RBP-24], 105
        MOV     BYTE PTR [%RBP-23], 106
        MOV     BYTE PTR [%RBP-22], 107
        MOV     BYTE PTR [%RBP-21], 108
        MOV     BYTE PTR [%RBP-20], 109
        MOV     BYTE PTR [%RBP-19], 110
        MOV     BYTE PTR [%RBP-18], 111
        MOV     BYTE PTR [%RBP-17], 112
        MOV     BYTE PTR [%RBP-16], 113
        MOV     BYTE PTR [%RBP-15], 114
        MOV     BYTE PTR [%RBP-14], 115
        MOV     BYTE PTR [%RBP-13], 116
        MOV     BYTE PTR [%RBP-12], 117
        MOV     BYTE PTR [%RBP-11], 118
        MOV     BYTE PTR [%RBP-10], 119
        MOV     BYTE PTR [%RBP-9], 120
        MOV     BYTE PTR [%RBP-8], 121
        MOV     BYTE PTR [%RBP-7], 122
        LEAVE
        RET
		
; Split as QWORD into WORDs
two:
        PUSH    RBP
        MOV     RBP, RSP
        MOVABS  RAX, 7523094288207667809
        MOVABS  RDX, 8101815670912281193
        MOV     QWORD PTR [RBP-32], RAX
        MOV     QWORD PTR [RBP-24], RDX
        MOVABS  RAX, 8680537053616894577
        MOV     QWORD PTR [RBP-16], RAX
        MOV     WORD PTR [RBP-8], 31353
        NOP
        POP     RBP
        RET
		
	
; Split as variable into WORDs
three:
        PUSH    RBP
        MOV     RBP, RSP
        MOV     RAX, QWORD PTR [MyString]
        MOV     QWORD PTR [RBP - 32], RAX
        MOV     RAX, QWORD PTR [MyString+8]
        MOV     QWORD PTR [RBP - 24], RAX
        MOV     RAX, QWORD PTR [MyString+16]
        MOV     QWORD PTR [RBP - 16], RAX
        MOV     CX, WORD PTR [MyString+24]
        MOV     WORD PTR [RBP - 8], CX
        POP     RBP
        RET

MyString
        .ASCII   "abcdefghijklmnopqrstuvwxyz"
# DW_AT_EXTERNAL
