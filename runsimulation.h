#ifndef RUNSIMULATION_H
#define RUNSIMULATION_H

#include "simulation.h"
#include <chrono>


/// <summary>
/// Class directly for running an already existing simulation
/// Singleton class with only static members
/// </summary>
class RunningSimulation
{
	///Simulation that is currently ran
	static Simulation* simulation;
	///If the simulation is paused (visual)
	static bool pause;
	///If the simulation has ended
	static bool end;
	///Maximum number of iteration that a simulation is ran for
	static long int maxiteration;
	///If the simulation has ended by reaching the iteration limit
	static bool reachedTooMany;
	///If the current associated simulation is dynamically allocated, then this class will delete it
	static bool responsibility;
	///If the simulation data should be saved to a file after finishing it
	static bool savemode;

#ifndef CPORTA

	/// <summary>
	/// Handles the user input during the visual simulation
	/// </summary>
	/// <param name="event">current SF event</param>
	static bool userInput(sf::Event& event);
#endif
	/// <summary>
	/// Resets most static data member to its starting state
	/// </summary>
	static void resetAttributes() {
		pause = false; end = false; reachedTooMany = false;
	}

	/// <summary>
	/// Private constructor, because this class is purely static
	/// </summary>
	RunningSimulation();

	RunningSimulation(const RunningSimulation&);

	RunningSimulation operator=(const RunningSimulation&);
public:

	/// <summary>
	/// Returns what the current mode is: saving or no saving
	/// </summary>
	static bool saveMode() { return savemode; }

	/// <summary>
	/// Sets whether the simulation should save
	/// </summary>
	static void saveMode(bool mode) { savemode = mode; }

	/// <summary>
	/// Sets the limit of iterations
	/// </summary>
	static void maxIteration(long int maxit) { maxiteration = maxit; }

	/// <summary>
	/// Sets up the simulation to later run
	/// </summary>
	static void setup(Simulation* sim, bool resp = false,long int maxit = 10000000);

	/// <summary>
	/// Returns whether the simulation has reached maximum iterations
	/// </summary>
	static bool reachedMaxIt() { return reachedTooMany; }

	/// <summary>
	/// Returns the pointer of the current simulation
	/// </summary>
	static Simulation* getSimulation() { return simulation; }

	/// <summary>
	/// Starts running the simulation, with no visuals, until it ends
	/// </summary>
	/// <returns>Returns the end state of the simulation</returns>
	static State startNonVisual(bool displaytext = true);

#ifndef CPORTA
	/// <summary>
	/// Starts running the simulation with SFML, until it has ended
	/// </summary>
	/// <returns>Returns the end state of the simulation</returns>
	static State startVisual();
#endif
	/// <summary>
	/// Changes the simulation associated with this class, resetting all its attributes
	/// </summary>
	/// <param name="newsim">Pointer to the simulation to connect</param>
	/// <param name="resp">True if the simulation was dinamically allocated</param>
	static void changeSimulation(Simulation* newsim, bool resp = false) {
		if (responsibility) delete simulation;
		responsibility = resp;
		simulation = newsim;
		resetAttributes();
	}

	/// <summary>
	/// Changes the simulation to simulate a new system from a new file
	/// </summary>
	/// <param name="filename">Name of file to be read from</param>
	static void newSystem(const char* filename)
	{
		if (simulation == nullptr) throw "No simulation to change!";
		simulation->resetSim();
		simulation->readFromFile(filename);
		resetAttributes();
	}

	///<summary>
	///If responsibility is true, then it deletes the current simulation and then changes it to nullptr
	///Resets everything
	///</summary>
	static void deleteSim();

};


#endif
