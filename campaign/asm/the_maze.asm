; [The Mazeの課題: 迷路探索するアセンブラ]
; NOTE: 右手法で攻略する(壁に右手伝いでひたすら前進)

; 壁情報 (INの値)
; IN=0: 道
; IN=1: 壁

; ロボットの操作 (OUTの値)
; OUT=0: 左旋回
; OUT=1: 前進
; OUT=2: 右旋回

START:
    imm 2
    mov r4, r0
    mov out, r4
CHECK_WALL:
    mov r5, in
    mov r1, r5
    imm 0
    mov r2, r0
    sub
    imm MOVE_FWD
    jz
    imm 0
    mov r4, r0
    mov out, r4
    imm CHECK_WALL
    jmp
MOVE_FWD:
    imm 1
    mov r4, r0
    mov out, r4
    imm START
    jmp