/* 
 * audio.cpp
 *
 * implementation of bindings to portaudio
 *
 * foo() - invoke some portaudio function
 *
 * Copyright (c) Thiemo Herbst, 2014
 *
 * */

#include "audio.h"

int foo() {
	return Pa_GetVersion();
}
