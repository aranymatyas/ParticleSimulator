#include "container.h"
#include <iostream>
#include <fstream>
#include <time.h>
#include <string>

#ifdef TESTMODE
#include "memtrace.h"
#endif

ParticleContainer::ParticleContainer() : part(nullptr), size(0), mem(5), state(Accelerating) {}

Particle* ParticleContainer::operator[](size_t idx) const
{
	return part[idx];
}

void ParticleContainer::read(const char* filename)
{
	if (filename == nullptr) return;
	if (part != nullptr || size > 0) throw "Container data is about to be overwritten! You need to first destroy the container";
	
	part = new Particle* [mem];
	try {
		std::ifstream input(filename);
		if (!input.good()) throw &input;
		input >> std::skipws;
		while (input.good())
		{
			char movetype;
			ParticleType type;
			input >> movetype;

			//removing comments
			if (movetype == '/') {
				std::string comment;
				std::getline(input, comment);
			}
			else
			{
				//reading position coordinates
				float x, y;
				input >> type >> x >> y;

				//static particle
				if (movetype == 'S')
				{
					unsigned int mass = 0;
					int charge = 0;
					if (type == None)
					{
						input >> mass >> charge;
					}
					if (!input) throw &input;

					newItem(false, x, y, mass, charge, type);
				}

				//dynamic particle
				else if (movetype == 'D')
				{
					float velx, vely;
					unsigned int mass = 0;
					int charge = 0;
					input >> velx >> vely;
					if (type == None)
					{
						input >> mass >> charge;
					}
					if (!input) throw &input;

					newItem(true, x, y, mass, charge, type, velx, vely);
				}
				else throw &input;
			}
		}
		input.close();
	}
	catch (std::ifstream* inp) {
		inp->close();
		destroy();
		throw "Hiba a fajllal!";
	}
}

void ParticleContainer::destroy()
{
	for (size_t i = 0; i < size; i++)
	{
		delete part[i];
	}
	delete[] part;
	part = nullptr;
	size = 0;
	mem = 5;
}

ParticleContainer::~ParticleContainer()
{
	destroy();
}

void ParticleContainer::calculateCoulombs(const float) const
{ //NOT USED CURRENTLY
	for (size_t i = 0; i < size; i++)
	{
		for (size_t j = 0; j < size; j++)
		{
			if (j != i)
				part[i]->calcCoulomb(*part[j]);
		}
	}
}

void ParticleContainer::increaseMemory()
{
	if (size >= mem)
	{
		mem += 5;
		Particle** newcont = new Particle * [mem];
		for (size_t i = 0; i < size; i++)
		{
			newcont[i] = part[i];
		}
		delete[] part;
		part = newcont;
	}
}

void ParticleContainer::newItem(bool isDynamic, float x, float y, unsigned int mass, int charge, ParticleType type, float velx, float vely)
{
	
	if (isDynamic)  part[size++] = new DynamicParticle(x, y, mass, charge, velx, vely, type);
	else			part[size++] = new StaticParticle(x, y, mass, charge, type);

	increaseMemory();

}

void ParticleContainer::deleteItem(size_t const idx)
{
	if (idx >= size) return;

	delete part[idx];
	for (size_t i = idx; i < size - 1; i++)
	{
		part[i] = part[i + 1];
	}
	size--;

	//decreasing memory if needed
	if (size < mem - 5)
	{
		mem -= 5;
		if (mem <= 0) mem = 1;
		Particle** newcont = new Particle * [mem];
		for (size_t i = 0; i < size; i++)
		{
			newcont[i] = part[i];
		}
		delete[] part;
		part = newcont;
	}
}

bool ParticleContainer::refreshPositions(const float speed)
{
	bool changeInState = false;

	for (size_t i = 0; i < size; i++)
	{
		if (part[i]->refreshPos(speed))
		{	//there was a change in the state of the particle
			changeInState = true;

			if (part[i]->isOutOfView())
			{
				//deleting any particle out of screen
				deleteItem(i);
			}
		}
	}
	if (changeInState) {
		//refreshing state of whole system, because at least one state changed
		refreshState();
	}
	return changeInState;
}

void ParticleContainer::refreshState()
{
	if (size == 0) { state = OutOfView; return; }

	State newstate = Calm;
	for (size_t i = 0; i < size; i++)
	{
		//taking advantage of the hierarchy of states
		if (part[i]->getState() < newstate) newstate = part[i]->getState();
	}
	state = newstate;
}

std::ostream& operator<<(std::ostream& os, ParticleContainer const& rhs)
{
	for (size_t i = 0; i < rhs.getSize(); i++)
	{
		os << "\t" << i + 1 << ".: " << rhs[i]->
			ParticleString() << std::endl;
	}
	os << std::endl << "\tOverall state of whole system: ";
	os << rhs.getState();
	return os;
}

/*void ParticleContainer::newItem(ParticleType type, bool isDynamic, float x, float y, float velx, float vely)
{	//NOT REALLY NEEDED...
	if (type == None) return;
	if(isDynamic)
	{
		switch (type)
		{
		case Proton:	part[size++] = new DynamicProton(x, y, velx, vely); break;
		case Electron:	part[size++] = new DynamicElectron(x, y, velx, vely); break;
		case Positron:	part[size++] = new DynamicPositron(x, y, velx, vely); break;
		}
	}
	else
	{
		switch (type)
		{
		case Proton:	part[size++] = new StaticProton(x, y); break;
		case Electron:	part[size++] = new StaticElectron(x, y); break;
		case Positron:	part[size++] = new StaticPositron(x, y); break;
		}
	}
}*/

