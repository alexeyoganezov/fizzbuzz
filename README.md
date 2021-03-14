# FizzBuzz

FizzBuzz application written in [NASM](https://nasm.us/) for x86-64 Linux.

## Build and usage

```
nasm fizzbuzz.asm -f elf64
gcc fizzbuzz.o -o fizzbuzz -no-pie
./fizzbuzz
```

