.POSIX:

include config.mk

# Sources
#CPP_HEADERS = $(shell find src -name "*.hpp")
#C_HEADERS   = $(shell find src -name "*.h")
#HEADERS     = $(CPP_HEADERS) $(C_HEADERS)

CPP_SRC     = $(shell find src -name "*.cpp")
C_SRC       = $(shell find src -name "*.c")

CPP_OBJ     = $(CPP_SRC:.cpp=.o)
C_OBJ       = $(C_SRC:.c=.o)
OBJ         = $(CPP_OBJ) $(C_OBJ)

COMPILE_DB  = $(OBJ:.o=.o.json)

all: options $(NAME)

# Header dependencies
#src/main.o:

# File generation
.cpp.o:
ifeq ($(CPP), clang++)
	$(CPP) $(JP_CPP_FLAGS) -c $< -o $@ $(COMPILE_DB_GEN_FLAG)
else
	$(CPP) $(JP_CPP_FLAGS) -c $< -o $@
endif

.c.o:
ifeq ($(CC), clang)
	$(CC) $(JP_C_FLAGS) -c $< -o $@ $(COMPILE_DB_GEN_FLAG)
else
	$(CC) $(JP_C_FLAGS) -c $< -o $@
endif

# Phonies
options:
	@echo
	@echo Build options:
	@echo
	@echo "CPP_FLAGS   = $(JP_CPP_FLAGS)"
	@echo "JP_LD_FLAGS = $(JP_LD_FLAGS)"
	@echo "CPP         = $(CPP)"
	@echo

$(NAME): $(OBJ)
	$(CPP) -o $@ $(OBJ) $(JP_LD_FLAGS)
	cat $(COMPILE_DB) > compile_commands.json

clean:
	rm -f $(NAME) compile_commands.json $(COMPILE_DB) $(OBJ)

.PHONY: all options clean
