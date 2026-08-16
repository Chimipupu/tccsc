; [MOD 4の課題: INのをMOD4してOUTするアセンブラ]
; NOTE: 要求仕様で8サイクル以内に処理を終わせなあかん

INIT:
    imm 3
    mov r2, r0

LOOP:
    mov r1, in
    and
    mov out, r3

    imm LOOP
    jmp