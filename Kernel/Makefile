BUILD ?= build
KERNEL ?= rt.elf

ARCH ?= riscv

RISCV_PREFIX ?= riscv64-unknown-elf-
ARM_PREFIX ?= aarch64-linux-gnu-

ifeq ($(ARCH),riscv)
	CXX = $(RISCV_PREFIX)g++
	LD = $(RISCV_PREFIX)ld
	AS = $(RISCV_PREFIX)as
	CXXFLAGS = -DARCH_RISCV
	LDFLAGS = -T Arch/RISCV/linker.ld
else ifeq ($(ARCH),arm64)
	CXX = $(ARM_PREFIX)g++
	LD = $(ARM_PREFIX)ld
	AS = $(ARM_PREFIX)as
	CXXFLAGS = -DARCH_ARM64
	LDFLAGS = -T Arch/Aarch64/linker.ld
else
	$(error Unsupported architecture: $(ARCH))
endif

# these are mostly the same for both architectures
CXXFLAGS += -Wall -Werror -O -fno-omit-frame-pointer -ggdb
CXXFLAGS += -mcmodel=medany -mno-relax
CXXFLAGS += -ffreestanding -fno-common -nostdlib -nostartfiles -fno-rtti -fno-exceptions
CXXFLAGS += -I. -fno-stack-protector -fno-pie -no-pie

CXXFILES = $(shell find -L * -type f -name '*.cpp')
ASFILES = $(shell find -L * -type f -name '*.S')
OBJ = $(addprefix obj/,$(CXXFILES:.cpp=.cpp.o) $(ASFILES:.S=.S.o))

.PHONY: all
all: $(BUILD)/$(KERNEL)

$(BUILD)/$(KERNEL): $(OBJ)
	mkdir -p "$$(dirname $@)"
	$(LD) $(LDFLAGS) $(OBJ) -o $@

# Compilation rules for *.cpp files.
obj/%.cpp.o: %.cpp
	mkdir -p "$$(dirname $@)"
	$(CXX) $(CXXFLAGS) -c $< -o $@
 
# Compilation rules for *.S files.
obj/%.S.o: %.S
	mkdir -p "$$(dirname $@)"
	$(AS) $(ASFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(BUILD) obj