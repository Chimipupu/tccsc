; [CIRCUMFERENCEの課題: 2πrを計算するアセンブラ]
; NOTE: πは3の時点で2πrは6rになる
; NOTE: CPUに乗算と分岐命令がないから半径rの加算を6回繰り返せばOK

; [半径rの取得]
mov r1, in ;「in」からR1に半径rを入力
mov r2, r1 ; R1からR2に半径rを入力

; [半径rの加算を繰り返し]
add ; 半径rの加算: 2r
mov r2, r3
add ; 半径rの加算: 3r
mov r2, r3
add ; 半径rの加算: 4r
mov r2, r3
add ; 半径rの加算: 5r
mov r2, r3
add ; 半径rの加算: 6r

; [結果を出力]
mov out, r3

; [RAMの先頭アドレスに戻る]
imm 0 ; R0 = 0
jmp   ; RAMのアドレス(=R0)に戻る