#ifndef WINDOW_H
#define WINDOW_H

/// <summary>
/// Resoluton of simulation screen
/// </summary>
const int resX = 1000;
/// <summary>
/// Resoluton of simulation screen
/// </summary>
const int resY = 1000;

/// <summary>
/// Epsilon value for determining whether vectors are equal
/// </summary>
const float epsilon = 0.005f;

/// <summary>
/// Determines when a particle shall be treated as out of screen
/// </summary>
const float outofviewratio = 3;

/// <summary>
/// Scaling ratio for calculating the coulomb forces
/// </summary>
const float coulombscale = 6000;

/// <summary>
/// The scaling for the change in velocity, calculated by the acceleration
/// </summary>
const float accelerationscale = 350;

///Not implemented
const float gravityscale = 0.001f;

#endif
