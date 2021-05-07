CC = g++
CFLAGS  = -g -Wall

full: software_full.cpp software.hpp raytri.cpp
	$(CC) $(CFLAGS) software_full.cpp software.hpp raytri.cpp -o software

single: software_single.cpp software.hpp raytri.cpp
	$(CC) $(CFLAGS) software_single.cpp software.hpp raytri.cpp -o software

clean:
	rm software