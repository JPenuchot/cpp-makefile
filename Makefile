.POSIX:

include config.mk

# Sources
CXXSRC = $(shell find src -name *.cpp)
CCSRC  = $(shell find src -name *.c)

# Objects
CXXOBJ = $(CXXSRC:.cpp=.o)
CCOBJ  = $(CCSRC:.c=.o)
OBJ    = $(CXXOBJ) $(CCOBJ)

# Dependency files
DEPS   = $(OBJ:.o=.d)

all: $(NAME)

# Compilation
.cpp.o:
	$(CXX) $(COMMON_FLAGS) $(CXXFLAGS) -MMD -c -o $@ $<
.c.o:
	$(CC) $(COMMON_FLAGS) $(CCFLAGS) -MMD -c -o $@ $<

# Linking
$(NAME): $(OBJ)
	$(CXX) -o $@ $(OBJ) $(LDFLAGS)

# Dependencies
-include $(DEPS)

debug: CXXFLAGS += -DDEBUG -g
debug: CCFLAGS  += -DDEBUG -g
debug: $(NAME)

clean:
	rm -f $(NAME) $(OBJ) $(DEPS)

run: $(NAME)
	./$(NAME)

dump: $(NAME)
	objdump -dC $(NAME) > $(NAME).asm

.PHONY: all clean
