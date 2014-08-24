/* 
 * hello portaudio
 *
 * Copyright (c) Thiemo Herbst, 2014
 *
 * */

#include <iostream>
#include "audio.h"

int main() {
	PaError portaudioReturn= 0;
	std::cout << std::endl;
	std::cout << "This is signalgenerator version 0.0!\n";
	std::cout << " ... using portaudio version " << foo() << "\n\n";

	std::cout << "initializing Portaudio ... ";
	portaudioReturn = Pa_Initialize();
	std::cout << Pa_GetErrorText(portaudioReturn) << "\n";
	if (portaudioReturn != paNoError) {
		std::cout << "FAILED! -> aborting ...\n";
		return 1;
	}

	std::cout << "terminating Portaudio ... ";
	portaudioReturn = Pa_Terminate();
	std::cout << Pa_GetErrorText(portaudioReturn) << "\n";
	if (portaudioReturn != paNoError) {
		std::cout << "FAILED! -> aborting ...\n";
		return 1;
	}

	std::cout << std::endl;
	std::cout << "Portaudio seems to work!\nMore to come ...\n";
	std::cout << "exiting!\n" << std::endl;
	return 0;
}
