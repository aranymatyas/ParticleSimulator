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
<member name="M:Particles.getPos" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="35">
<summary>
Returns the position vector of the particle
</summary>
</member>
<member name="M:Particles.getMass" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="40">
<summary>
Returns the mass of the particle
</summary>
</member>
<member name="M:Particles.getCharge" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="45">
<summary>
Returns the charge of the particle
</summary>
</member>
<member name="M:Particles.isOutOfView" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="50">
<summary>
Returns whether the particle is OutOfView = far out of screen
</summary>
</member>
<member name="M:Particles.isAccelerating" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="55">
<summary>
Returns whether the particle is Accelerating
</summary>
</member>
<member name="M:Particles.isBalanced" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="60">
<summary>
Returns whether the particle is Balanced
</summary>
</member>
<member name="M:Particles.isCalm" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="65">
<summary>
Returns whether the particle is Calm
</summary>
</member>
<member name="M:Particles.getState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="70">
<summary>
Returns the state of the particle
</summary>
</member>
<member name="M:Particles.particleString" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="75">
<summary>
Provides the string description of a particle
</summary>
</member>
<member name="M:Particles.getType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="80">
<summary>
Returns Dynamic / Static
</summary>
<param name="other"></param>
</member>
<member name="M:Particles.getPType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="88">
<summary>
Returns the particle type of the particle
</summary>
</member>
<member name="M:Particles.getShape" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="93">
<summary>
Returns with the shape of the particle
</summary>
</member>
<member name="M:Particles.calcGravity(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="99">
<summary>
Calculates force of gravity, affecting the particle, caused by another particle
</summary>
</member>
<member name="M:Particles.calcCoulomb(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="104">
<summary>
Calculates the Coulomb force affecting the particle, caused by another particle
</summary>
</member>
<member name="M:Particles.refreshPoz(System.Single!System.Runtime.CompilerServices.IsConst)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="109">
<summary>
Refreshes the position of particle, determined by the forces and its velocity
</summary>
/// <returns>Whether there was a change in state</returns>
</member>
<member name="M:Particles.refreshState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="115">
<summary>
Refreshes the state of a particle, determined by its velocity, and acceleration
</summary>
<returns>Whether there was a change in state</returns>
</member>
<member name="T:StaticParticles" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="123">
<summary>
Static particles that don't move
</summary>
</member>
<member name="M:StaticParticles.#ctor(System.Single,System.Single,System.UInt32,System.Int32,ParticleType)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="129">
<summary>
Creates object with the given attributes
</summary>
</member>
<member name="M:StaticParticles.calcGravity(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="137">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.calcCoulomb(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="142">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.refreshPoz(System.Single!System.Runtime.CompilerServices.IsConst)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="147">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.refreshState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="152">
<summary>
Does nothing for a static particle
</summary>
</member>
<member name="M:StaticParticles.getType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="157">
<summary>
Return Stacic type
</summary>
</member>
<member name="M:StaticParticles.getVel" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="162">
<summary>
Return the velocity of particle
</summary>
<returns></returns>
</member>
<member name="T:DynamicParticles" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="170">
<summary>
Dynamic particles that move by the laws of physics
</summary>
</member>
<member name="M:DynamicParticles.#ctor(System.Single,System.Single,System.UInt32,System.Int32,System.Single,System.Single,ParticleType)" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="178">
<summary>
Creates object with the given attributes
</summary>
</member>
<member name="M:DynamicParticles.calcGravity(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="183">
<summary>
Calculates force of gravity, affecting the particle, caused by another particle
</summary>
</member>
<member name="M:DynamicParticles.calcCoulomb(Particles!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="188">
<summary>
Calculates the Coulomb force affecting the particle, caused by another particle
</summary>
<returns>The type of collision if the two particles collided</returns>
</member>
<member name="M:DynamicParticles.refreshPoz(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="194">
<summary>
Refreshes the position of particle, determined by the forces and its velocity
</summary>
<param>The speed of the particle (delta T)</param>
<returns>Whether there was a change in state</returns>
</member>
<member name="M:DynamicParticles.refreshState" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="201">
<summary>
Refreshes the state of the particle
</summary>
<returns>If there was a change in state</returns>
</member>
<member name="M:DynamicParticles.getType" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="207">
<summary>
Returns Dynamic type
</summary>
</member>
<member name="M:DynamicParticles.getVel" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\particles.h" line="212">
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
<member name="M:ParticleContainer.newItem(System.Boolean,System.Single,System.Single,System.UInt32,System.Int32,ParticleType,System.Single,System.Single)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="27">
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
<member name="M:ParticleContainer.deleteItem(System.UInt64!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="39">
<summary>
Deletes item from the container
</summary>
<param name="idx">The index of the item to delete</param>
</member>
<member name="M:ParticleContainer.calculateCoulombs(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="45">
<summary>
Calculates every coulomb of between every particle in the container
</summary>
<param name="speed">The speed of the rate of change</param>
</member>
<member name="M:ParticleContainer.refreshPositions(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="51">
<summary>
Refreshes positions of every particle in the system
</summary>
<param name="speed">The speed of the rate of change</param>
If there was a change in the state of some particles of the system: returns true
<returns></returns>
</member>
<member name="M:ParticleContainer.refreshState" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="59">
<summary>
Refreshes the overall state of the container, determined by the state of its members
</summary>
</member>
<member name="M:ParticleContainer.read(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="64">
<summary>
Builds an array of particle from a file
</summary>
<param name="filename">Name of file to be read from</param>
</member>
<member name="M:ParticleContainer.op_Subscript(System.UInt64)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="70">
<summary>

</summary>
<param name="idx">Index of the particle to be returned</param>
<returns>Returns the particle at the given index</returns>
</member>
<member name="M:ParticleContainer.getSize" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="77">
<summary>
Returns the size of the container
</summary>
</member>
<member name="M:ParticleContainer.getState" decl="false" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="82">
<summary>
Returns the overall state of the container
</summary>
</member>
<member name="M:ParticleContainer.destroy" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="87">
<summary>
Frees the memory allocated for the container, resetting it
</summary>
</member>
<member name="M:op_LeftShift(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,ParticleContainer!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="X:\Saját\prog\BME\prog2\Nagyhazi\proba2\container.h" line="98">
<summary>
Prints out the whole array, including the types and states of its particles, and the whole system
</summary>
<param name="os"></param>
<param name="rhs"></param>
<returns></returns>
</member>
</members>
</doc>