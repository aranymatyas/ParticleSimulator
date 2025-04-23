#include "systemstates.h"
#include "particles.h"

std::istream& operator>>(std::istream& is, ParticleType& type)
{
	std::string raw;
	is >> raw;
	if (raw == "Proton")		type = Proton;
	else if (raw == "Electron") type = Electron;
	else if (raw == "Positron") type = Positron;
	else if (raw == "Neutron")	type = Neutron;
	else if (raw == "Neutrino")	type = Neutrino;
	else if (raw == "Deuterium")	type = Deuterium;
	else type = None;
	return is;
}

const char* getParticleTypeString(ParticleType const type)
{
	switch (type)
	{
	case Proton: return "Proton";
	case Electron: return "Electron";
	case Positron: return "Positron";
	case Neutron: return "Neutron";
	case Neutrino: return "Neutrino";
	case Deuterium: return "Deuterium";
	case None: return "None";
	}
	return "0";
}

const char* getStateString(State const state)
{
	switch (state)
	{
	case Calm: return "Calm";
	case Balanced: return "Balanced";
	case Accelerating: return "Accelerating";
	case OutOfView: return "None remained";
	case Orbit: return "Orbit";
	}
	return "0";
}

std::ostream& operator<<(std::ostream& os, ParticleType const type)
{
	os << getParticleTypeString(type);
	return os;
}

std::ostream& operator<<(std::ostream& os, State const type)
{
	os << getStateString(type);
	return os;
}