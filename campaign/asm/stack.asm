; [STACKの課題: PUSHとPOPを実装するアセンブラ]
; 要求仕様: INの値が0    -> POP動作
; 要求仕様: INの値が0以外 -> PUSH動作

; [メインルーチン]
MAIN:
    in r1           ; 入力をr1に読み込む

    ; 比較と分岐
    cmp r1, 0       ; r1と0を比較
    je DO_POP       ; IN == 0 の場合、DO_POPへジャンプ
    jne DO_PUSH     ; IN != 0 の場合、DO_PUSHへジャンプ

; [スタックにPUSHするサブルーチン]
DO_PUSH:
    ; 1. スタックポインタを4バイト減らして空きを作る
    sub sp, sp, 4
    ; 2. SPの指すアドレスにr1の値を格納する (32ビット)
    store_32 [sp], r1
    jmp MAIN        ; MAINに戻る

; [スタックからPOPするサブルーチン]
DO_POP:
    ; 1. SPの指すアドレスから値をr2に読み込む (32ビット)
    load_32 r2, [sp]
    ; 2. スタックポインタを4バイト増やして領域を解放する
    add sp, sp, 4
    out r2          ; 取り出した値を出力する
    jmp MAIN        ; MAINに戻る