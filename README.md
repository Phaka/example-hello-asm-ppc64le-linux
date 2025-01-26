# Hello World in PowerPC64 LE Assembly (Linux)

A simple Hello World implementation in PowerPC64 Little-Endian assembly language for Linux systems. PowerPC64 LE represents the modern evolution of the PowerPC architecture, used in contemporary IBM POWER systems and supported by major Linux distributions.

## Installation

On a PowerPC64 LE Linux system, you'll need the standard GNU toolchain:

```bash
sudo apt-get update
sudo apt-get install binutils gcc
```

## Running

Assemble and link:
```bash
as -o main.o main.s -mlittle -m64
ld -o hello main.o -EL
./hello
```

## Code Explanation

The PowerPC64 LE implementation introduces several modern features that distinguish it from other PowerPC variants. This implementation demonstrates the ELFv2 ABI and the little-endian adaptations of the 64-bit PowerPC architecture.

### Key Architectural Features

ELFv2 ABI:
- Specified by `.abiversion 2` directive
- Introduces a more efficient function calling convention
- Uses a different approach to position-independent code
- Simplifies the handling of function pointers

Memory Access and TOC:
- Uses little-endian byte ordering
- TOC (Table of Contents) based addressing using register 2
- `@toc` references for position-independent code
- 8-byte alignment for optimal 64-bit access

Register Usage:
- Register 0: System call number
- Register 2: TOC base register
- Register 3: First argument (file descriptor or return code)
- Register 4: Second argument (message address)
- Register 5: Third argument (message length)

Instructions:
- li (Load Immediate): Loads a 16-bit value
- addis (Add Immediate Shifted): Adds a shifted 16-bit value
- addi (Add Immediate): Adds a 16-bit value
- sc (System Call): Triggers kernel service

### Differences from Other PowerPC Variants

Compared to PowerPC64 Big-Endian:
- Uses ELFv2 ABI instead of ELFv1
- Different TOC addressing scheme
- Little-endian byte ordering
- Simpler function prologue/epilogue sequences

Compared to PowerPC32 LE:
- Full 64-bit register width
- Different ABI specification
- More sophisticated TOC-based addressing
- Different alignment requirements

### Modern Usage

PowerPC64 LE has become the standard for modern PowerPC systems because:
- Better compatibility with little-endian systems
- More efficient ABI design
- Better performance in modern workloads
- Wider software ecosystem support

The implementation demonstrates how PowerPC has evolved to meet modern computing needs while maintaining backward compatibility where necessary. The ELFv2 ABI and little-endian byte ordering make it easier to port software from other architectures, particularly x86_64.
