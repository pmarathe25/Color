include ../makefile.defines
BUILDDIR = build
BINDIR = ~/bin
TESTDIR = test
SRCDIR = src
# Objects
OBJS = $(call generate_obj_names,$(SRCDIR),$(BUILDDIR))
LIB = lib/libstealthcolor.so
# Headers
INCLUDEPATH = include
INCLUDE = -I$(INCLUDEPATH)
HEADERS = $(call find_headers,$(INCLUDEPATH))
# Compiler settings
CXX = g++
CFLAGS = -fPIC -c -std=c++17 $(INCLUDE) -flto -O3 -Wpedantic -march=native
LFLAGS = -shared -flto -O3 -march=native

.PHONY: clean lib install uninstall

$(LIB): $(OBJS)
	$(CXX) $(LFLAGS) $(OBJS) -o $(LIB)

$(BUILDDIR)/Color.o: $(SRCDIR)/Color.cpp include/Color.hpp
	$(CXX) $(CFLAGS) $(SRCDIR)/Color.cpp -o $(BUILDDIR)/Color.o

$(BUILDDIR)/ColorPalette.o: $(SRCDIR)/ColorPalette.cpp include/ColorPalette.hpp
	$(CXX) $(CFLAGS) $(SRCDIR)/ColorPalette.cpp -o $(BUILDDIR)/ColorPalette.o

clean:
	rm $(OBJS) $(LIB)

lib: $(LIB)

install: lib
	$(call install_headers,$(INCLUDEPATH),Color,$(HEADERS))
	make lib
	sudo ln -snf $(CURDIR)/$(LIB) /usr/local/lib/libstealthcolor.so
	sudo ldconfig

uninstall:
	$(call uninstall_headers,Color)
	-sudo rm /usr/local/lib/libstealthcolor.so
