# Project version
NAME		= prog
VERSION = 0.0.1

# Paths
PREFIX    = /usr/local
MANPREFIX = $(PREFIX)/share/man

# Compilers
CXX = clang++
CC  = clang

# Includes/Libs
CXXINCS = -Iinclude
CCINCS  = -Iinclude
LIBS    = -lm

# Flags
COMMON_FLAGS = -DVERSION=\"$(VERSION)\"\
							 -Wall -Wextra -Werror\
							 -Wnull-dereference\
							 -Wold-style-cast\
							 -Wdouble-promotion\
							 -Wshadow\
							 -O3 -march=native

ADD_CXXFLAGS = $(COMMON_FLAGS) -std=c++17
ADD_CCFLAGS  = $(COMMON_FLAGS) -std=c11
ADD_LDFLAGS  = -fPIC

CXXFLAGS = $(CXXINCS) $(ADD_CXXFLAGS)
CCFLAGS  = $(CCINCS) $(ADD_CCFLAGS)
LDFLAGS  = $(LIBS) $(ADD_LDFLAGS)
