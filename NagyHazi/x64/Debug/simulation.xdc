<?xml version="1.0"?><doc>
<members>
<member name="T:State" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\systemstates.h" line="9">
<summary>
Represents the state of a single particle, or a whole system
</summary>
</member>
<member name="T:MoveTypes" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\systemstates.h" line="14">
<summary>
For defining the move behaviour of a particle
</summary>
</member>
<member name="T:ParticleType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\systemstates.h" line="19">
<summary>
Predefined particle types
</summary>
</member>
<member name="M:getStateString(State!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\systemstates.h" line="24">
<summary>
Gives the (printable) c-string of a State name
</summary>
<param name="state">State value to be evaluated</param>
<returns>C-string of the state's name</returns>
</member>
<member name="M:getParticleTypeString(ParticleType!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\systemstates.h" line="31">
<summary>
Gives the (printable) c-string of a base particle type name
</summary>
<param name="state">Particle type value to be evaluated</param>
<returns>C-string of the particle's name</returns>
</member>
<member name="M:Vector.op_Modulus(Vector!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\vector.h" line="19">
<summary>
Gives the distance between two vectors
</summary>
<param name="rhs">
</param>
<returns>
Distance between the two points
</returns>
</member>
<member name="M:Vector.distance(Vector!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\vector.h" line="29">
<summary>
Returns the distance between two vectors
</summary>
</member>
<member name="T:Particles" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="15">
<summary>
Abstract class for any kind of particle
</summary>
</member>
<member name="M:Particles.#ctor(System.Single,System.Single,System.UInt32,System.Int32,ParticleType)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="30">
<summary>
Constructor with default particle type of 'None'
</summary>
</member>
<member name="M:Particles.getPos" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="37">
<summary>
Returns the position vector of the particle
</summary>
</member>
<member name="M:Particles.getMass" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="42">
<summary>
Returns the mass of the particle
</summary>
</member>
<member name="M:Particles.getCharge" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="47">
<summary>
Returns the charge of the particle
</summary>
</member>
<member name="M:Particles.isOutOfView" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="52">
<summary>
Returns whether the particle is OutOfView = far out of screen
</summary>
</member>
<member name="M:Particles.isAccelerating" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="57">
<summary>
Returns whether the particle is Accelerating
</summary>
</member>
<member name="M:Particles.isBalanced" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="62">
<summary>
Returns whether the particle is Balanced
</summary>
</member>
<member name="M:Particles.isCalm" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="67">
<summary>
Returns whether the particle is Calm
</summary>
</member>
<member name="M:Particles.getState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="72">
<summary>
Returns the state of the particle
</summary>
</member>
<member name="M:Particles.particleString" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="77">
<summary>
Provides the string description of a particle
</summary>
</member>
<member name="M:Particles.getType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="82">
<summary>
Returns Dynamic / Static
</summary>
<param name="other"></param>
</member>
<member name="M:Particles.getPType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="90">
<summary>
Returns the particle type of the particle
</summary>
</member>
<member name="M:Particles.getShape" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="95">
<summary>
Returns with the shape of the particle
</summary>
</member>
<member name="M:Particles.calcGravity(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="101">
<summary>
Calculates force of gravity, affecting the particle, caused by another particle
</summary>
</member>
<member name="M:Particles.calcCoulomb(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="106">
<summary>
Calculates the Coulomb force affecting the particle, caused by another particle
</summary>
</member>
<member name="M:Particles.refreshPoz(System.Single!System.Runtime.CompilerServices.IsConst)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="111">
<summary>
Refreshes the position of particle, determined by the forces and its velocity
</summary>
/// <returns>Whether there was a change in state</returns>
</member>
<member name="M:Particles.refreshState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="117">
<summary>
Refreshes the state of a particle, determined by its velocity, and acceleration
</summary>
<returns>Whether there was a change in state</returns>
</member>
<member name="T:StaticParticles" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="125">
<summary>
Static particles that don't move
</summary>
</member>
<member name="M:StaticParticles.#ctor(System.Single,System.Single,System.UInt32,System.Int32,ParticleType)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="131">
<summary>
Creates object with the given attributes
</summary>
</member>
<member name="M:StaticParticles.calcGravity(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="139">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.calcCoulomb(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="144">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.refreshPoz(System.Single!System.Runtime.CompilerServices.IsConst)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="149">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.refreshState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="154">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.getType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="159">
<summary>
Return Stacic type
</summary>
</member>
<member name="M:StaticParticles.getVel" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="164">
<summary>
Return the velocity of particle
</summary>
<returns></returns>
</member>
<member name="T:DynamicParticles" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="172">
<summary>
Dynamic particles that move by the laws of physics
</summary>
</member>
<member name="M:DynamicParticles.#ctor(System.Single,System.Single,System.UInt32,System.Int32,System.Single,System.Single,ParticleType)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="180">
<summary>
Creates object with the given attributes
</summary>
</member>
<member name="M:DynamicParticles.calcGravity(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="185">
<summary>
Calculates force of gravity, affecting the particle, caused by another particle
</summary>
</member>
<member name="M:DynamicParticles.calcCoulomb(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="190">
<summary>
Calculates the Coulomb force affecting the particle, caused by another particle
</summary>
<returns>The type of collision if the two particles collided</returns>
</member>
<member name="M:DynamicParticles.refreshPoz(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="196">
<summary>
Refreshes the position of particle, determined by the forces and its velocity
</summary>
<param>The speed of the particle (delta T)</param>
<returns>Whether there was a change in state</returns>
</member>
<member name="M:DynamicParticles.refreshState" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="203">
<summary>
Refreshes the state of the particle
</summary>
<returns>If there was a change in state</returns>
</member>
<member name="M:DynamicParticles.getType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="209">
<summary>
Returns Dynamic type
</summary>
</member>
<member name="M:DynamicParticles.getVel" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="214">
<summary>
Return the velocity of particle
</summary>
<returns></returns>
</member>
<member name="T:DynamicProton" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\baseparticletypes.h" line="6">
<summary>
Not used currently
</summary>
</member>
<member name="T:ParticleContainer" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="8">
<summary>
Class for and array of particles, can refresh the attributes of every item in it
</summary>
</member>
<member name="M:ParticleContainer.increaseMemory" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="18">
<summary>
Increases the dynamically allocated memory if needed
</summary>
</member>
<member name="M:ParticleContainer.insert(Particles*)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="27">
<summary>
Adds the preallocated particle to the container
</summary>
</member>
<member name="M:ParticleContainer.newItem(System.Boolean,System.Single,System.Single,System.UInt32,System.Int32,ParticleType,System.Single,System.Single)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="35">
<summary>
Adds new particle to the container
</summary>
<param name="isDynamic">If the new particle should be dynamic</param>
<param name="x">starting X coordinate</param>
<param name="y">starting Y coordinate</param>
<param name="mass">The mass of the new particle</param>
<param name="charge">The charge of the new particle</param>
<param name="velx">The starting x velocity of new particle (ignored if static)</param>
<param name="vely">The starting y velocity of new particle (ignored if static)</param>
</member>
<member name="M:ParticleContainer.deleteItem(System.UInt64!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="47">
<summary>
Deletes item from the container
</summary>
<param name="idx">The index of the item to delete</param>
</member>
<member name="M:ParticleContainer.calculateCoulombs(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="53">
<summary>
Calculates every coulomb of between every particle in the container
</summary>
<param name="speed">The speed of the rate of change</param>
</member>
<member name="M:ParticleContainer.refreshPositions(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="59">
<summary>
Refreshes positions of every particle in the system
</summary>
<param name="speed">The speed of the rate of change</param>
If there was a change in the state of some particles of the system: returns true
<returns></returns>
</member>
<member name="M:ParticleContainer.refreshState" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="67">
<summary>
Refreshes the overall state of the container, determined by the state of its members
</summary>
</member>
<member name="M:ParticleContainer.read(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="72">
<summary>
Builds an array of particle from a file
</summary>
<param name="filename">Name of file to be read from</param>
</member>
<member name="M:ParticleContainer.op_Subscript(System.UInt64)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="78">
<summary>

</summary>
<param name="idx">Index of the particle to be returned</param>
<returns>Returns the particle at the given index</returns>
</member>
<member name="M:ParticleContainer.getSize" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="85">
<summary>
Returns the size of the container
</summary>
</member>
<member name="M:ParticleContainer.getState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="90">
<summary>
Returns the overall state of the container
</summary>
</member>
<member name="M:ParticleContainer.destroy" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="95">
<summary>
Frees the memory allocated for the container, resetting it
</summary>
</member>
<member name="M:op_LeftShift(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,ParticleContainer!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="106">
<summary>
Prints out the whole array, including the types and states of its particles, and the whole system
</summary>
<param name="os"></param>
<param name="rhs"></param>
<returns></returns>
</member>
<member name="T:Simulation" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="6">
<summary>
Simulation for systems of particles
</summary>
</member>
<member name="M:Simulation.refreshText" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="24">
<summary>
Refreshes the SFML text of the simulation
</summary>
</member>
<member name="M:Simulation.refreshEndState" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="29">
<summary>
Refreshes the end state of the simulation, this determines when a simulation should be terminated
</summary>
</member>
<member name="M:Simulation.handleCollision(Collision,System.Int32,System.Int32)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="34">
<summary>
Handles the collisions happening in the simulated system
</summary>
</member>
<member name="M:Simulation.#ctor(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="40">
<summary>
Constructs the simulation from the filename given
</summary>
</member>
<member name="M:Simulation.op_Subscript(System.UInt64)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="45">
<summary>Index operator</summary>
<param name="i"></param>
<returns>returns the particle in the particle given by its index</returns>
</member>
<member name="M:Simulation.getSize" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="50">
<summary>
Returns the size of the simulation, the number of particles in it
</summary>
<returns></returns>
</member>
<member name="M:Simulation.getName" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="56">
<summary>
Returns the name of the simulation
</summary>
<returns></returns>
</member>
<member name="M:Simulation.getEndState" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="62">
<summary>
Returns the end state of the simulation, calculated by its members' states
</summary>
<returns></returns>
</member>
<member name="M:Simulation.isValid" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="68">
<summary>
If the simulation is valid and ready
</summary>
</member>
<member name="M:Simulation.print(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="73">
<summary>
Prints out the array of particles of the simulation
</summary>
<param name="os"></param>
</member>
<member name="M:Simulation.reduceSpeed" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="79">
<summary>
Reduces the speed of the simulation
</summary>
</member>
<member name="M:Simulation.increaseSpeed" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="84">
<summary>
Increases the speed of the simulation
</summary>
</member>
<member name="M:Simulation.iterate" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="89">
<summary>
Iterates the simulation by one step, refreshing the position, velocity and state of every particle
</summary>
<returns>If there was a change in state</returns>
</member>
<member name="M:Simulation.readFromFile(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="95">
<summary>
Reads the particle data from a file, to start the simulation with
</summary>
<param name="filename">Name of file to be read from</param>
</member>
<member name="M:Simulation.resetSim" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="112">
<summary>
Resets the object, allowing it to simulate new systems
</summary>
</member>
<member name="M:Simulation.saveToFile(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="117">
<summary>
Writes the exact state of the system in a file, which is able to be read back, to start the simulation again
</summary>
<param name="filename">Name of file to be written in</param>
</member>
<member name="M:Simulation.addNewParticle" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="123">
<summary>
Adds a new particle to the simulation, with random attributes
</summary>
</member>
<member name="M:Simulation.op_Implicit~System.Int32" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="128">
<summary>
Casting int returns the iteration number
</summary>
</member>
<member name="M:Simulation.getText" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="134">
<summary>
Returns the SFML text of the simulation to be drawn
</summary>
<returns></returns>
</member>
<member name="M:Simulation.getShape(System.UInt64)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\simulation.h" line="140">
<summary>
Returns the SFML shape of the indexed particle
</summary>
<param name="idx">Index of needed particle</param>
<returns></returns>
</member>
</members>
</doc>