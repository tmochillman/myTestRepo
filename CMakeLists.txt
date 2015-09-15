project (helloportaudio)

set (	CMAKE_CXX_FLAGS_RELEASE
	"-Os"
)
set (	CMAKE_CXX_FLAGS_DEBUG
	"-O0 -pedantic -Wall -Wextra"
)

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

