.L1:
  vmovupd ymm0,YMMWORD PTR [rdi+rsi*1]
  vmovupd ymm1,YMMWORD PTR [rdi+rsi*1+0x20]
  vmovupd ymm2,YMMWORD PTR [rdi+rsi*1+0x40]
  vmovupd ymm3,YMMWORD PTR [rdi+rsi*1+0x60]
  vmulpd ymm0,ymm0,ymm0
  vmulpd ymm1,ymm1,ymm1
  vmulpd ymm2,ymm2,ymm2
  vmulpd ymm3,ymm3,ymm3
  vmovupd YMMWORD PTR [rdi+rsi*1],ymm0
  vmovupd YMMWORD PTR [rdi+rsi*1+0x20],ymm1
  vmovupd YMMWORD PTR [rdi+rsi*1+0x40],ymm2
  vmovupd YMMWORD PTR [rdi+rsi*1+0x60],ymm3
  sub    rsi,0xffffffffffffff80
  cmp    rdx,rsi
  jne    .L1
