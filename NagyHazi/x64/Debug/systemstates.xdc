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
</members>
</doc>