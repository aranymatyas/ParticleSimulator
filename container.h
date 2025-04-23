#ifndef CONTAINER_H
#define CONTAINER_H

#include "particles.h"
#include <iostream>

/// <summary>
/// Class for and array of Particle, can refresh the attributes of every item in it
/// </summary>
class ParticleContainer
{
	///Arry of Particle in the container
	Particle** part;
	///Number of Particles in the container
	size_t size;
	///Size of allocated memory
	size_t mem;
	///Overall state, determined by each particle
	State state;

	/// <summary>
	/// Increases the dynamically allocated memory if needed
	/// </summary>
	void increaseMemory();

	/// <summary>
	/// Copy constructor not designed to be used
	/// </summary>
	ParticleContainer(ParticleContainer const&) : ParticleContainer() { std::cout << "Nincs masolo konstruktor!" << std::endl; }

	ParticleContainer operator=(ParticleContainer const&) {}
public: 

	ParticleContainer();

	/// <summary>
	/// Adds the preallocated particle to the container
	/// </summary>
	void insert(Particle* item) {
		part[size++] = item;
		increaseMemory();
	}

	/// <summary>
	/// Adds new particle to the container
	/// </summary>
	/// <param name="isDynamic">If the new particle should be dynamic</param>
	/// <param name="x">starting X coordinate</param>
	/// <param name="y">starting Y coordinate</param>
	/// <param name="mass">The mass of the new particle</param>
	/// <param name="charge">The charge of the new particle</param>
	/// <param name="type">The predefined type of the new particle</param>
	/// <param name="velx">The starting x velocity of new particle (ignored if static)</param>
	/// <param name="vely">The starting y velocity of new particle (ignored if static)</param>
	void newItem(bool isDynamic, float x, float y, unsigned int mass, int charge, ParticleType type = None, float velx = 0, float vely = 0 );
	
	/// <summary>
	/// Deletes item from the container
	/// </summary>
	/// <param name="idx">The index of the item to delete</param>
	void deleteItem(size_t const idx);

	/// <summary>
	/// Calculates every coulomb of between every particle in the container
	/// </summary>
	/// <param name="speed">The speed of the rate of change</param>
	void calculateCoulombs(float const speed) const;

	/// <summary>
	/// Refreshes positions of every particle in the system
	/// </summary>
	/// <param name="speed">The speed of the rate of change</param>
	/// If there was a change in the state of some Particle of the system: returns true
	/// <returns></returns>
	bool refreshPositions(float const speed);

	/// <summary>
	/// Refreshes the overall state of the container, determined by the state of its members
	/// </summary>
	void refreshState();

	/// <summary>
	/// Builds an array of particle from a file
	/// </summary>
	/// <param name="filename">Name of file to be read from</param>
	void read(const char* filename);

	/// <summary>
	/// 
	/// </summary>
	/// <param name="idx">Index of the particle to be returned</param>
	/// <returns>Returns the particle at the given index</returns>
	Particle* operator[](size_t idx) const;

	/// <summary>
	/// Returns the size of the container
	/// </summary>
	size_t getSize() const { return size; }

	/// <summary>
	/// Returns the overall state of the container
	/// </summary>
	State getState() const { return state; }

	/// <summary>
	/// Frees the memory allocated for the container, resetting it
	/// </summary>
	void destroy();

	~ParticleContainer();

};

/// <summary>
/// Prints out the whole array, including the types and states of its Particle, and the whole system
/// </summary>
/// <param name="os"></param>
/// <param name="rhs"></param>
/// <returns></returns>
std::ostream& operator<<(std::ostream& os, ParticleContainer const& rhs);


#endif
