
all: qemu

qemu: bootable
	qemu-system-x86_64 boot.bin

bootable:
	nasm -f bin boot.asm -o boot.bin

clean:
	rm *.bin
