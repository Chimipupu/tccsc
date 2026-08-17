; [NIMの課題: トランプのNIMで勝つアセンブラ]

loop:
    in r1           ; 現在のカードの枚数をinからr1に入力
    sub r2, r1, 1   ; r2 = r1 - 1
    and r2, r2, 3   ; r2 = r2 AND 3 (4の剰余を計算)
    out r2          ; 計算した枚数を出力して、カードを引く
    jmp loop