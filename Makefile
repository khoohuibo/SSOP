CC=gcc
CFLAGS=-I.


BUILDDIR = build
SRCDIR = src
OBJDIR = $(BUILDDIR)/obj
INCDIR = inc

EXE := $(BUILDDIR)/ssop
SRC := $(wildcard $(SRCDIR)/*.c)
OBJ := $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
INC := $(wildcard $(INCDIR)/*.h)

.PHONY: all clean

default: all

all: $(OBJ) | $(BINDIR)
	gcc -o $(EXE) $(OBJDIR)/main.o

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INC) | $(OBJDIR)
	$(CC) -c $< -o $@ $(CFLAGS)

$(BINDIR) $(OBJDIR):
	mkdir -p $@

clean:
	@$(RM) -rv $(BINDIR) $(OBJDIR)

