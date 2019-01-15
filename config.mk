# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    = /usr/local
MANPREFIX = $(PREFIX)/share/man

# Compilers
CXX = clang++
CC  = clang

# Compile flags
COMMON_FLAGS += -O3 -march=native
COMMON_FLAGS += -DVERSION=\"$(VERSION)\"
COMMON_FLAGS += -Wall -Wextra -Werror -Wnull-dereference -Wold-style-cast\
                -Wdouble-promotion -Wshadow

# Link flags
LDFLAGS  += -fPIC -O3

CXXFLAGS += -std=c++17
CCFLAGS  += -std=c11

# Includes/Libs
CXXFLAGS += -Iinclude
CCFLAGS  += -Iinclude
LDFLAGS  += -lm
