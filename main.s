# PowerPC64 LE assembly for Linux
# System calls for PowerPC64 LE Linux:
# 4 for write
# 1 for exit

        .abiversion 2           # Specify ELFv2 ABI
        .section ".text"
        .align 2
        .global _start
_start:
        # Write system call
        li      0,4             # System call number for write
        li      3,1             # File descriptor 1 is stdout
        addis   4,2,message@toc@ha    # Load high adjusted TOC-relative part
        addi    4,4,message@toc@l     # Add low part to complete address
        li      5,14            # Message length
        sc                      # Make system call

        # Exit system call
        li      0,1             # System call number for exit
        li      3,0             # Return code 0
        sc                      # Make system call

        .section ".rodata"
        .align 3               # 8-byte alignment for 64-bit
message:
        .ascii "Hello, World!\n"
