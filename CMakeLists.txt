project (helloportaudio)
cmake_minimum_required (VERSION 2.6)

set (CMAKE_CXX_FLAGS_RELEASE	"-Os")
set (CMAKE_CXX_FLAGS_DEBUG	"-O0 -pedantic -Wall -Wextra")
ENABLE_TESTING()

find_library (
	portaudio
	libportaudio.a
)

add_executable (
	helloportaudio
	main.cpp
	audio.cpp
)

target_link_libraries (
	helloportaudio
	portaudio
)

add_test (
	maintest helloportaudio
)
