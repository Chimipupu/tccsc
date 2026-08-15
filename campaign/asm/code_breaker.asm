; [CODE BREAKERの課題: カウント値を0~255でOUTするだけのアセンブラ]
; NOTE: 255から出力する

; R4をカウント値にする
INIT:
    imm R5_INIT
    jmp

; R5を255にする
; NOTE: immは6bit幅なので63までしか扱えない (CPUは8Bit幅)
R5_INIT:
    ; 処理: R3 = 126
    imm 63
    mov r1, r0 ; R = 63
    mov r2, r0 ; R = 63
    add        ; R3 = 63 + 63 = 126

    ; 処理: R3 = 252
    mov r1, r3 ; R1 = 126
    mov r2, r3 ; R2 = 126
    add        ; R3 = 126 + 126 = 252

    ; 処理: R3,R5 = 255
    imm 3
    mov r1, r0 ; R1 = 3
    mov r2, r3 ; R2 = 252
    add        ; R3 = 3 + 252 = 255
    mov r5, r3 ; R5 = 255

    ; カウント値を255からスタート
    mov r4, r5

    imm LOOP
    jmp

LOOP:
    ; カウント値をOUT
    mov out, r4

    ; 条件分岐 (カウント値 == 0 ?)
    mov r1, r4
    imm 0
    mov r2, r0
    imm END
    jz         ; if(R3 == 0?) { jmp END }

    ; カウント値を-1
    imm 1
    mov r1, r4 ; R1 = カウント値
    mov r2, r0 ; R2 = 1
    sub        ; R3 = カウント値 - 1
    mov r4, r3 ; R4 = R3

    ; else { LOOPの頭に戻る }
    imm LOOP
    jmp

END:
    ; ゲーム側のリセット待ち
    nop
    nop
    nop
    nop
    nop