# CPUの仕様

- 汎用レジスタ
  - R0~R5の6本
  - R1とR2は計算用
  - R3は計算結果用
- その他レジスタ
  - はin, outがある
- 命令セット
  - mov,jmp,nop
  - 算術論理演算（add,sub,and,nand,or,nor）
    - R1とR2を計算してR3に結果が入る
  - 即値は「imm 5」とすれば5がR0に入る
