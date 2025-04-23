#ifndef SYSTEM_H
#define SYSTEM_H

#include <iostream>

/// <summary>
/// Represents which two kinds of particles are colliding
/// </summary>
enum Collision { NoCollision, ProtonElectron, ProtonNeutron, PositronElectron };

/// <summary>
/// Represents the state of a single particle, or a whole system
/// </summary>
enum State { OutOfView, Accelerating, Balanced, Calm, Orbit };

///<summary>
///For defining the move behaviour of a particle
///</summary>
enum MoveTypes { Static, Dynamic };

///<summary>
///Predefined particle types
///</summary>
enum ParticleType { None, Proton, Electron, Neutron, Positron, Neutrino, Deuterium };

/// <summary>
/// Gives the (printable) c-string of a State name
/// </summary>
/// <param name="state">State value to be evaluated</param>
/// <returns>C-string of the state's name</returns>
const char* getStateString(State const state);

/// <summary>
/// Gives the (printable) c-string of a base particle type name
/// </summary>
/// <param name="state">Particle type value to be evaluated</param>
/// <returns>C-string of the particle's name</returns>
const char* getParticleTypeString(ParticleType const type);

std::istream& operator>>(std::istream& is, ParticleType& type);

std::ostream& operator<<(std::ostream& os, ParticleType const type);

std::ostream& operator<<(std::ostream& os, State const type);

#endif
