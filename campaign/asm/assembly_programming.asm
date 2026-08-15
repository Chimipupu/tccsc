; [ASSEMBLY PROGRAMMINGの課題: INの値に+5した値をOUTに出力するアセンブラ]

; [R1に5を代入]
imm 5
mov r1, r0

; [R2にINの値を代入]
mov r2, in

; [加算]
; NOTE: ADD命令はR1 + R2 = R3
add

; [R3の値をOUTに出力]
mov out, r3

; [RAMの先頭アドレスに戻る]
imm 0 ; R0 = 0
jmp   ; RAMのアドレス(=R0)に戻る