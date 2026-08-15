; [CONDITIONAL JUMPSの課題: JMP命令だけで条件分岐]

; [初期化]
; 処理: INの読み出しカウンタ(cnt)をR4にする
; 処理: cnt = 0
INIT:
    imm 0
    mov r4, r0    ; cnt = 0

; [INの読み出しループ]
LOOP:
    ; --- カウントアップ処理 ---
    ; 処理: cnt++;
    imm 1         ; R0 = 1
    mov r1, r4    ; R1 = cnt
    mov r2, r0    ; R2 = 1
    add           ; R3 = R1 + R2
    mov r4, r3    ; R4 に新しいカウント値を保存

    ; --- 条件分岐 (結果出力できるか否かを判定) ---
    ; 処理: if(R3が0（≒INが37）) { RESULTに飛ぶ };
    mov r1, in    ; R1 = INから読み込んだ値
    imm 37        ; R0 = 37
    mov r2, r0    ; R2 = 比較対象の 37
    sub           ; R3 = R1 - R2 (INの値 - 37)
    imm RESULT    ; R0 = RESULTラベルのアドレス
    jz            ; R3が0なら、R0(RESULT)へジャンプ

    ; 処理: else { LOOPの頭に戻る }
    imm LOOP
    jmp

; [結果出力]
; 処理: out = cnt;
; 処理: returnと再初期化;
RESULT:
    mov out, r4   ; INで37が出た時点のカウント値(R4)をoutに出力
    imm INIT      ; 初期化する
    jmp