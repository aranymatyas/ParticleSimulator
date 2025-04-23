#ifndef Particle_H
#define Particle_H

#include "CPORTA.h"
#include "window.h"
#include <cmath>
#include "systemstates.h"

#ifndef CPORTA
#include <SFML/Graphics.hpp>
#endif

#include "vector.h"

/// <summary>
/// Abstract class for any kind of particle
/// </summary>
class Particle {
protected:					
	///Position of the particle
	Vector pos;
	///Mass of the particle
	unsigned int mass;
	///Charge of the particle
	int charge;
	///State of the particle
	State state;
	///Predefined type of particle
	ParticleType type;		
#ifndef CPORTA
	///SFML Circleshape representation of the particle
	sf::CircleShape circ;	
#endif

public:
	/// <summary>
	/// Constructor with default particle type of 'None'
	/// </summary>
	Particle(float x, float y, unsigned int mass, int charge, ParticleType type = None);

	/// <summary>
	/// Constructor with default particle type of 'None'
	/// </summary>
	Particle(Vector pos, unsigned int mass, int charge, ParticleType type = None) : Particle(pos.x,pos.y, mass, charge, type) {}

	/// <summary>
	/// Returns the position vector of the particle
	/// </summary>
	Vector getPos() const { return pos; }

	/// <summary>
	/// Returns the mass of the particle
	/// </summary>
	unsigned int getMass() const { return mass; }

	/// <summary>
	/// Returns the charge of the particle
	/// </summary>
	int getCharge() const { return charge; }

	/// <summary>
	/// Returns whether the particle is OutOfView = far out of screen
	/// </summary>
	bool isOutOfView() const { return state == OutOfView; }

	/// <summary>
	/// Returns whether the particle is Accelerating
	/// </summary>
	bool isAccelerating() const { return state == Accelerating; }

	/// <summary>
	/// Returns whether the particle is Balanced
	/// </summary>
	bool isBalanced() const { return state == Balanced; }

	/// <summary>
	/// Returns whether the particle is Calm
	/// </summary>
	bool isCalm() const { return state == Calm; }

	/// <summary>
	/// Returns the state of the particle
	/// </summary>
	State getState() const { return state; }

	/// <summary>
	/// Provides the string description of a particle
	/// </summary>
	std::string ParticleString() const;

	/// <summary>
	/// Returns Dynamic / Static
	/// </summary>
	virtual MoveTypes getType() const = 0;

	/// <summary>
	/// Returns the velocity vector of the particle
	/// </summary>
	virtual Vector getVel() const = 0;

	/// <summary>
	/// Returns the particle type of the particle
	/// </summary>
	ParticleType getPType() const { return type; }
#ifndef CPORTA
	/// <summary>
	/// Returns with the shape of the particle
	/// </summary>
	sf::CircleShape getShape() const { return circ; }
#endif

	/// Calculates force of gravity, affecting the particle, caused by another particle
	//virtual void calcGravity(Particle const& other)=0;

	/// <summary>
	/// Calculates the Coulomb force affecting the particle, caused by another particle
	/// </summary>
	virtual Collision calcCoulomb(Particle const& other)=0;

	/// <summary>
	/// Refreshes the position of particle, determined by the forces and its velocity
	/// </summary>
	/// /// <returns>Whether there was a change in state</returns>
	virtual bool refreshPos(float const rate) = 0;

	/// <summary>
	/// Refreshes the state of a particle, determined by its velocity, and acceleration
	/// </summary>
	/// <returns>Whether there was a change in state</returns>
	virtual bool refreshState() = 0;

	virtual ~Particle() {}

};

/// <summary>
/// Static Particle that don't move
/// </summary>
class StaticParticle :public Particle {

public:
	/// <summary>
	/// Creates object with the given attributes
	/// </summary>
	StaticParticle(float x, float y, unsigned int mass, int charge, ParticleType type = None) : Particle(x, y, mass, charge, type) {
		state = Calm;
		if (abs(pos.x) > resX * outofviewratio || abs(pos.y) > resY * outofviewratio) state = OutOfView;
	}

	//void calcGravity(Particle const&) {}

	/// <summary>
	/// Does nothing for a static particle
	/// </summary>
	Collision calcCoulomb(Particle const&) { return NoCollision; }

	/// <summary>
	/// Does nothing for a static particle
	/// </summary>
	bool refreshPos(float const) { return state == OutOfView; }

	/// <summary>
	/// Does nothing for a static particle
	/// </summary>
	bool refreshState() { return false;  }

	///<summary>
	/// Return Stacic type
	///</summary>
	MoveTypes getType() const{ return Static; }

	/// <summary>
	/// Return the velocity of particle
	/// </summary>
	/// <returns></returns>
	Vector getVel() const { return Vector(0,0); }

};

/// <summary>
/// Dynamic Particle that move by the laws of physics
/// </summary>
class DynamicParticle :public Particle {
	///Velocity of the dynamic particle
	Vector vel;
	///Net force affecting the particle
	Vector force;

public:
	///<summary>
	///Creates object with the given attributes
	///</summary>
	DynamicParticle(float x, float y, unsigned int mass, int charge, float velx = 0, float vely = 0, ParticleType type = None) : Particle(x, y, mass, charge, type), vel(Vector(velx, vely)), force(Vector(0.0,0.0)) {}

	
	/// Calculates force of gravity, affecting the particle, caused by another particle
	//void calcGravity(Particle const& other);

	/// <summary>
	/// Calculates the Coulomb force affecting the particle, caused by another particle
	/// </summary>
	/// <returns>The type of collision if the two Particle collided</returns>
	Collision calcCoulomb(Particle const& other);

	/// <summary>
	/// Refreshes the position of particle, determined by the forces and its velocity
	/// </summary>
	/// <param name="rate">The speed of the particle (delta T)</param>
	/// <returns>Whether there was a change in state</returns>
	bool refreshPos(float const rate);

	/// <summary>
	/// Refreshes the state of the particle
	/// </summary>
	/// <returns>If there was a change in state</returns>
	bool refreshState();

	/// <summary>
	/// Returns Dynamic type
	/// </summary>
	MoveTypes getType() const { return Dynamic; }

	/// <summary>
	/// Return the velocity of particle
	/// </summary>
	/// <returns></returns>
	Vector getVel() const { return vel; }

};


#endif
