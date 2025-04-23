#ifndef SIMULATION_H
#define SIMULATION_H

#include "container.h"

/// <summary>
/// Simulation for systems of Particle
/// </summary>
class Simulation {
	///If there is a system to simulate
	bool valid;
	///Name of current simulation (from the file name)
	std::string name;
	///Current speed of the simulation
	float speed;
	///Default speed of system (also determines the maximum and minimum possible speed)
	const float basespeed;
	///Stores how many iterations have been calculated so far
	long int iteration;
	///Since how many iterations have there not been a change in state
	int sinceLastChange;
	///The current state of the system
	State currentState;
	///The ending state of the system, determined by several conditions
	State endState;
	///The array in which the Particle are stored
	ParticleContainer container;			
#ifndef CPORTA
	///Drawable text of the simulation
	sf::Text text;
	///Font for the SFML text of the simulation
	sf::Font font;

	/// <summary>
	/// Refreshes the SFML text of the simulation
	/// </summary>
	void refreshText();
#endif
	/// <summary>
	/// Refreshes the end state of the simulation, this determines when a simulation should be terminated
	/// </summary>
	void refreshEndState();

	/// <summary>
	/// Handles the collisions happening in the simulated system
	/// </summary>
	void handleCollision(Collision type, size_t i, size_t j);

public:
	/// <summary>
	/// Constructs the simulation from the filename given
	/// </summary>
	Simulation(const char* filename = nullptr, const float basespeed = 0.008f);

	/// <summary>Index operator</summary>
	/// <param name="idx">Index</param>
	/// <returns>returns the particle in the particle given by its index</returns>
	const 
		Particle* operator[](size_t idx) const { return container[idx]; }

	/// <summary>
	/// Returns the size of the simulation, the number of Particle in it
	/// </summary>
	/// <returns></returns>
	size_t getSize() const { return container.getSize(); }

	/// <summary>
	/// Returns the name of the simulation
	/// </summary>
	/// <returns></returns>
	std::string getName() const { return name; }

	/// <summary>
	/// Returns the end state of the simulation, calculated by its members' states
	/// </summary>
	/// <returns></returns>
	State getEndState() const;

	/// <summary>
	/// If the simulation is valid and ready
	/// </summary>
	bool isValid() const { return valid; }

	/// <summary>
	/// Prints out the array of Particle of the simulation
	/// </summary>
	/// <param name="os"></param>
	void print(std::ostream& os) const { os << container; }

	/// <summary>
	/// Reduces the speed of the simulation
	/// </summary>
	void reduceSpeed() { speed = static_cast<float>(0.5f * basespeed > speed * 0.9f ? 0.5f * basespeed : speed * 0.9f ); }

	/// <summary>
	/// Increases the speed of the simulation
	/// </summary>
	void increaseSpeed() { speed = static_cast<float>(2.0f * basespeed < speed * 1.111f ? 2.0f * basespeed : speed * 1.111f); }

	/// <summary>
	/// Iterates the simulation by one step, refreshing the position, velocity and state of every particle
	/// </summary>
	/// <returns>If there was a change in state</returns>
	bool iterate();

	/// <summary>
	/// Reads the particle data from a file, to start the simulation with
	/// </summary>
	/// <param name="filename">Name of file to be read from</param>
	void readFromFile(const char* filename) { 
		container.read(filename);
		if (filename != nullptr)
		{
			valid = true;
			name = filename;
			name = name.substr(0, name.find('.'));
		}
	#ifndef CPORTA
		refreshText();
	#endif
	}

	/// <summary>
	/// Resets the object, allowing it to simulate new systems
	/// </summary>
	void resetSim();

	/// <summary>
	/// Writes the exact state of the system in a file, which is able to be read back, to start the simulation again
	/// </summary>
	/// <param name="filename">Name of file to be written in</param>
	void saveToFile(const char* filename = nullptr) const;

	/// <summary>
	/// Adds a new particle to the simulation, with random attributes
	/// </summary>
	void addNewParticle();

	/// <summary>
	/// Casting int returns the iteration number
	/// </summary>
	operator int() const { return iteration; }

#ifndef CPORTA
	/// <summary>
	/// Returns the SFML text of the simulation to be drawn
	/// </summary>
	/// <returns></returns>
	sf::Text const getText() const;

	/// <summary>
	/// Returns the SFML shape of the indexed particle
	/// </summary>
	/// <param name="idx">Index of needed particle</param>
	/// <returns></returns>
	sf::CircleShape const getShape(size_t idx) const { return container[idx]->getShape(); }
#endif

};

std::ostream& operator<<(std::ostream& os, const Simulation& rhs);


#endif
