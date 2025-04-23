#include "simulation.h"
#include <fstream>


bool Simulation::iterate()
{
	iteration++;
	for (size_t i = 0; i < container.getSize(); i++)
	{
		for (size_t j = 0; j < container.getSize(); j++)
		{
			if (j != i)
				handleCollision(container[i]->calcCoulomb(*container[j]), i, j);
		}
	}

	refreshEndState();
	if (container.refreshPositions(speed))
	{
		sinceLastChange = 0;
#ifndef CPORTA
		refreshText();
#endif
		currentState = container.getState();
		return true;
	}
	else
	{
#ifndef CPORTA
		if (iteration == 1)
			refreshText();
#endif
		sinceLastChange++;
		return false;
	}
	
}

std::ostream& operator<<(std::ostream& os, const Simulation& rhs)
{
	rhs.print(os);
	return os;
}

void Simulation::addNewParticle()
{
	if (container.getSize() > 19) return;
	name = "custom";
	float x = static_cast<float>((rand() % resX));
	float y = static_cast<float>((rand() % resY));
	float velx = static_cast<float>((rand() % 25));
	float vely = static_cast<float>((rand() % 25));
	ParticleType type = ParticleType(rand() % 4 + 1);
	container.newItem(true, x, y, 0, 0, type, velx, vely);
#ifndef CPORTA
	refreshText();
#endif
	sinceLastChange = 0;
}

void Simulation::refreshEndState()
{
	endState = Accelerating;
	if (sinceLastChange > 50000 && currentState == Accelerating)
	{
		endState = Orbit;
		currentState = Orbit;
#ifndef CPORTA
		refreshText();
#endif
	}
	if (sinceLastChange > 6000 && currentState > Accelerating)
	{
		endState = currentState;
#ifndef CPORTA
		refreshText();
#endif
	}
	if (container.getSize() == 0)
	{
		currentState = endState = Calm;
#ifndef CPORTA
		refreshText();
#endif
	}
	if (endState != Accelerating) valid = false;
	
}

State Simulation::getEndState() const
{
	return endState;
}

Simulation::Simulation(const char* filename, const float basespeed) : valid(false), name(""), speed(basespeed), basespeed(basespeed), iteration(0), sinceLastChange(0),
					currentState(Accelerating), endState(Accelerating), container()
{
	readFromFile(filename);
	if (container.getSize() > 0) valid = true;
#ifndef CPORTA
	srand(static_cast<unsigned int>(time(nullptr)));
	if (!font.loadFromFile("arial.ttf")) throw "error";
	text.setFont(font);
	text.setCharacterSize(16);
	text.setFillColor(sf::Color::White);
	text.setPosition(sf::Vector2f(0, 0));
#endif
}

void Simulation::saveToFile(const char* filename) const
{
	std::string fname;
	if (filename == nullptr) fname = name + "_Ending.txt";
	else fname = filename;
	std::ofstream os(fname);
	if (!os.good()) throw "Hiba a kimeneti fajllal";

	for (size_t i = 0; i < container.getSize(); i++)
	{
		os << (container[i]->getType() == Static ? 'S' : 'D') << ' ';
		os << container[i]->getPType() << '\t';
		os << container[i]->getPos().x << '\t' << container[i]->getPos().y;
			
		if (container[i]->getType() == Dynamic) os << '\t' << container[i]->getVel().x << '\t' << container[i]->getVel().y;

		if (container[i]->getPType() == None) os << '\t' << container[i]->getMass() << '\t' << container[i]->getCharge();

		if (i != container.getSize() - 1) os << std::endl;
	}
	os.close();
}

void Simulation::resetSim()
{
	name = "";
	speed = basespeed;
	iteration = 0;
	sinceLastChange = 0;
	endState = currentState = Accelerating;
	container.destroy();
	valid = false;
}

void Simulation::handleCollision(Collision type, size_t i, size_t j)
{
	if (type == NoCollision || i == j) return;
	const float pi = 3.1415f;
	Vector newpos = container[i]->getPos();
	Vector netVel = container[i]->getVel() * container[i]->getMass() + container[j]->getVel() * container[j]->getMass();
	
	container.deleteItem(j > i ? j : i);
	container.deleteItem(j < i ? j : i);

	if (type == ProtonElectron)
	{	
		netVel.rotate( pi / 4 );
		container.newItem(true, newpos.x, newpos.y, 0, 0, Neutrino, netVel.x, netVel.y);

		netVel = netVel / 1840;
		netVel.rotate(-pi / 2);
		container.newItem(true, newpos.x, newpos.y, 0, 0, Neutron, netVel.x, netVel.y);
	}
	if (type == ProtonNeutron)
	{
		netVel = netVel / (1840 * 2);
		container.newItem(true, newpos.x, newpos.y, 0, 0, Deuterium, netVel.x, netVel.y);
	}
	if (type == PositronElectron)
	{
		//Foton keletkezik
	}
	
}

#ifndef CPORTA
sf::Text const Simulation::getText() const
{
	return text;
}

void Simulation::refreshText()
{

	std::string textraw = "\t\tName of simulation: " + name + "\n";
	for (int i = 0; i < container.getSize(); i++)
	{
		textraw += "\t" + std::to_string(i + 1) + ".:" + container[i]->ParticleString() + "\n";
	}
	textraw += "\n\tOverall state of whole system: ";
	textraw += getStateString(currentState);

	if (endState != Accelerating) textraw += "\n\t\tSimulation ended!";

	unsigned int newsize = 25 - (unsigned int)container.getSize() > 12 ? 25 - (unsigned int)container.getSize() : 12;
	text.setCharacterSize(newsize);
	text.setString(textraw);

}
#endif