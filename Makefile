.POSIX:

include config.mk

# Sources

CPP_SRC     = $(wildcard src/*.cpp)
C_SRC       = $(wildcard src/*.c)

CPP_OBJ     = $(CPP_SRC:.cpp=.o)
C_OBJ       = $(C_SRC:.c=.o)
OBJ         = $(CPP_OBJ) $(C_OBJ)
DEPS        = $(OBJ:.o=.d)

COMPILE_DB  = $(OBJ:.o=.o.json)

all: options $(NAME)

-include $(DEPS)

# File generation

.cpp.o:
ifeq ($(CPP), clang++)
	$(CPP) $(JP_CPP_FLAGS) -MMD -c $< -o $@ $(COMPILE_DB_GEN_FLAG)
else
	$(CPP) $(JP_CPP_FLAGS) -MMD -c $< -o $@
endif

.c.o:
ifeq ($(CC), clang)
	$(CC) $(JP_C_FLAGS) -MMD -c $< -o $@ $(COMPILE_DB_GEN_FLAG)
else
	$(CC) $(JP_C_FLAGS) -MMD -c $< -o $@
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
ifeq ($(CPP), clang++)
	$(CPP) -o $@ $(OBJ) $(JP_LD_FLAGS)
	cat $(COMPILE_DB) > compile_commands.json
else
	$(CPP) -o $@ $(OBJ) $(JP_LD_FLAGS)
endif

clean:
	rm -f $(NAME) compile_commands.json $(COMPILE_DB) $(OBJ) $(DEPS)

.PHONY: all options clean
