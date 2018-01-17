BUILDDIR = build/
BINDIR = ~/bin/
TESTDIR = test/
SRCDIR = src/
# Objects
OBJS = $(addprefix $(BUILDDIR)/, Color.o ColorPalette.o)
# Headers
INCLUDEPATH = include/
INCLUDE = -I$(INCLUDEPATH)
HEADERS = $(addprefix $(INCLUDEPATH)/, Color.hpp ColorPalette.hpp)
# Compiler settings
CXX = g++
CFLAGS = -fPIC -c -std=c++17 $(INCLUDE) -flto -O3 -Wpedantic -march=native
LFLAGS = -shared -flto -O3 -march=native

lib/libstealthcolor.so: $(OBJS)
	$(CXX) $(LFLAGS) $(OBJS) -o lib/libstealthcolor.so

$(BUILDDIR)/Color.o: $(SRCDIR)/Color.cpp include/Color.hpp
	$(CXX) $(CFLAGS) $(SRCDIR)/Color.cpp -o $(BUILDDIR)/Color.o

$(BUILDDIR)/ColorPalette.o: $(SRCDIR)/ColorPalette.cpp include/ColorPalette.hpp
	$(CXX) $(CFLAGS) $(SRCDIR)/ColorPalette.cpp -o $(BUILDDIR)/ColorPalette.o

clean:
	rm $(OBJS)

lib: lib/libstealthcolor.so
