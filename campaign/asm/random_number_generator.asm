; [RANDOM NUMBER GENERATORの課題: 32bitの乱数生成アセンブラ]

init:
    ; 初期シード (※このシード値は完全ランダムっぽい)
    in r1

loop:
    rnd_tmp1:
        ; temp1 = seed xor (seed lsr 13)
        lsr r2, r1, 13
        xor r10, r1, r2

    rnd_tmp2:
        ; temp2 = temp1 xor (temp1 lsl 17)
        lsl r2, r10, 17
        xor r11, r10, r2

    rnd_result:
        ; result = temp2 xor (temp2 lsr 5)
        lsr r2, r11, 5
        xor r13, r11, r2
        out r13

        ; 次の乱数生成に向けて乱数resultをシード値に設定
        mov r1, r13

        jmp loop