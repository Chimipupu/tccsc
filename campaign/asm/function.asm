; @file function.asm
; @author Chimipupu(https://github.com/Chimipupu)
; @brief 乗算テストアセンブラ
; @version 0.1
; @date 2026-08-17
; @copyright Copyright (c) 2026 Chimipupu All Rights Reserved.

; [関数: main()]
main:
    ; [変数宣言]
    const RES   = r1
    const ARG_1 = r1
    const ARG_2 = r2

    in ARG_1 ; 最初の入力は2です
    in ARG_2 ; 2番目の入力は5です

    call power ; 2の5乗を計算

    ; []
    ; NOTE: 結果は「「32」が出力されることが期待値
    out RES

; [関数: multiply()]
multiply:
    ;　呼び出し元の値を復元できるようにPUSHして退避
    push r3

        ; [変数宣言]
        const LHS = r1 ; 乗算の左辺
        const RHS = r2 ; 乗算の右辺（残りの加算回数）
        const ACC = r3 ; アキュムレータ（計算結果の蓄積用）

        mov ACC, 0

        jmp mul_condition
        mul_start:
            sub RHS, RHS, 1
            add ACC, ACC, LHS
        mul_condition:
            cmp RHS, 0
            jne mul_start
            mov RES, ACC

    ; 呼び出し元の値をPOPして復元
    pop r3

    ret

; [関数: power()]
power:
    ;　呼び出し元の値を復元できるようにPUSHして退避
    push r3
    push r4

        ; [変数宣言]
        const BASE = r3
        const REM_POW = r4 ; 残りの乗数（計算回数）

        mov BASE, ARG_1
        sub REM_POW, ARG_2, 1

        ; 「残りの乗数」が0になるまで掛け算を繰り返します
        pow_start:
            sub REM_POW, REM_POW, 1
            mov ARG_2, BASE
            call multiply

        pow_condition:
            cmp REM_POW, 0
            jne pow_start

    ; 呼び出し元の値をPOPして復元
    pop r4
    pop r3

    ret