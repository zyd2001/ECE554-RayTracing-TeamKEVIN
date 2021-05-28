include common_include.mk

# Executable name
TEST = afu

BBB_DIR = ${FPGA_BBB_CCI_SRC}/BBB_cci_mpf/sw/include/

# Build directory
OBJDIR = obj
CFLAGS += -I./$(OBJDIR)
CPPFLAGS += -I./$(OBJDIR) -I$(BBB_DIR)

LDFLAGS += -lopae-cxx-core -lMPF-cxx -lMPF

# Files and folders
SRCS = main.cpp AFU.cpp
OBJS = $(addprefix $(OBJDIR)/,$(patsubst %.cpp,%.o,$(SRCS)))

# Targets
all: $(TEST) $(TEST)_ase
	python3 ./constant.py constant.data
	mv constant.data.out constant.binary
	python3 ./Assembler.py -r main.asm
	python3 ./triangle.py box_kevin.obj
	mv box_kevin.out box.binary
	mkdir out

# AFU info from JSON file, including AFU UUID
AFU_JSON_INFO = $(OBJDIR)/afu_json_info.h
$(AFU_JSON_INFO): ../../Hardware/rta.json | objdir
	afu_json_mgr json-info --afu-json=$^ --c-hdr=$@
$(OBJS): $(AFU_JSON_INFO)

$(TEST): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS) $(FPGA_LIBS)

$(TEST)_ase: $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS) $(ASE_LIBS)

$(OBJDIR)/%.o: %.cpp config.h AFU.h | objdir
	$(CXX) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(TEST) $(TEST)_ase $(OBJDIR) box.binary main.asm.out constant.binary out/

objdir:
	@mkdir -p $(OBJDIR)

.PHONY: all clean
