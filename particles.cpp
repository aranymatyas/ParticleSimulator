#include "particles.h"
#include <iostream>

/// <summary>
/// Checks if the two Particle are of the questioned types
/// </summary>
bool checkTypes(Particle const& first, Particle const& second, ParticleType a, ParticleType b)
{
	return
		(first.getPType() == b && second.getPType() == a) ||
		(first.getPType() == a && second.getPType() == b);
}

Particle::Particle(float x, float y, unsigned int mass, int charge, ParticleType type) : pos(Vector(x, y)), mass(mass), charge(charge), state(Accelerating), type(type)
{
	//Predetermined particle types automatically fill in their attributes
	if (type == Proton) { this->charge = 1; this->mass = 1840; }
	if (type == Electron) { this->charge = -1; this->mass = 1; }
	if (type == Positron) { this->charge = 1; this->mass = 1; }
	if (type == Neutron) { this->charge = 0; this->mass = 1840; }
	if (type == Neutrino) { this->charge = 0; this->mass = 1; }
	if (type == Deuterium) { this->charge = 1; this->mass = 1840 * 2; }

#ifndef CPORTA
	//The visualisation of the particle
	float radius = static_cast<float>(5 + sqrt(this->mass + 10) / 5.0);
	circ.setRadius(radius);
	circ.setPosition(sf::Vector2f(pos.x - radius , pos.y - radius));
	if (this->charge > 0) circ.setFillColor(sf::Color::Red);
	else if (this->charge < 0) circ.setFillColor(sf::Color::Blue);
	else circ.setFillColor(sf::Color::White);	
#endif
}

Collision DynamicParticle::calcCoulomb(Particle const& other) {

	if (&other == this) return NoCollision;

	float distance = pos.distance(other.getPos());

	//if there is a relevant collision
	if ((distance < 2.5f || distance < 0.009f * getVel().abs() ) && this->charge * other.getCharge() <= 0)
	{
		
		if (checkTypes(*this, other, Electron, Proton))
		{
			return ProtonElectron;
		}
		if (checkTypes(*this, other, Neutron, Proton))
		{
			return ProtonNeutron;
		}
		
		if (checkTypes(*this, other, Electron, Positron))
		{
			return PositronElectron;
		}
	}
	//Not in collision distance: can safely calculate forces
	else
	{
		Vector cforce = (other.getPos() - pos) / distance * (-1 * charge * other.getCharge() / (distance * distance)) * coulombscale;
		//						Vector for direction				Q1			Q2						r^2				scaling
		force = force + cforce;
	}
	return NoCollision;
}

/*
void DynamicParticle::calcGravity(Particle const& other) {
	//GRAVITATION IN PRACTICE DOES NOT MAKE A DIFFERENCE
	std::cout << "calculating grav..." << std::endl;
	float distance = pos % other.getPos();
	Vector gforce = (other.getPos() - pos) / distance * (other.getMass() / (distance * distance)) * gravityscale;
	force = force + gforce;
}*/

bool DynamicParticle::refreshState()
{
	State laststate = state;

	//if far out of screen
	if (abs(pos.x) > resX * outofviewratio || abs(pos.y) > resY * outofviewratio) state = OutOfView;

	//if acceleration is near zero
	else if (force.abs() / mass < epsilon)
	{
		//if velocity is near zero
		if (vel.abs() < epsilon) state = Calm;
		else state = Balanced;
	}
	else state = Accelerating;

	return state != laststate;

}

bool DynamicParticle::refreshPos(float const rate) {

	//refreshing state of particle and returning whether there was a change
	bool returnvalue = refreshState();

	Vector accelaration = force / mass;

	//velocity refreshed
	vel = vel + accelaration * rate * accelerationscale;

	//position refreshed
	pos = pos + vel * rate;

	//force is initialized for next iteration
	force = Vector();

#ifndef CPORTA
	circ.setPosition(sf::Vector2f(pos.x - circ.getRadius(), pos.y - circ.getRadius()));
#endif

	return returnvalue;
}

std::string Particle::ParticleString() const
{
	std::string out;
	if (getType() == Static) out = "Static ";
	else out = "Dynamic ";
	if (type != None)
	{
		out += getParticleTypeString(type);
		out += "\t\t";
	}
	else {
		if (charge > 0) out += "Positive ";
		else if (charge < 0) out += "Negative ";
		else out += "Neutral ";

		out += "particle\t";
	}
	out = (out + ":") + getStateString(state);
	return out;
}