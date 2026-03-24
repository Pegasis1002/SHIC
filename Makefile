# Variables
VERILATOR = verilator
V_FLAGS = --binary -j 0 --trace
SRC_DIR = rtl/alu
TB_DIR = tb
OBJ_DIR = obj_dir

# The 'Top' module for simulation (Change this as you move from 1-bit to 4-bit)
TOP_MODULE = adder_subber_32bit_tb

# Default target
all: build run visualize

# 1. Verilate and Build
build:
	$(VERILATOR) $(V_FLAGS) $(SRC_DIR)/full_adder.sv $(SRC_DIR)/4bit_adder.sv $(SRC_DIR)/8bit_adder.sv $(SRC_DIR)/32bit_adder.sv $(SRC_DIR)/32bit_adder_subber.sv $(TB_DIR)/$(TOP_MODULE).sv --top-module $(TOP_MODULE)

# 2. Run the simulation
run:
	./$(OBJ_DIR)/V$(TOP_MODULE)

# 3. Open GTKWave
visualize:
	gtkwave adder_subber_32bit.vcd

# Cleanup
clean:
	rm -rf $(OBJ_DIR) *.vcd
