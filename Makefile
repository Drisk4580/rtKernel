.PHONY: build
build:
	make -C Kernel

run:
	qemu-system-riscv64 -bios none -machine virt -serial mon:stdio -kernel Kernel/build/rt.elf -nographic