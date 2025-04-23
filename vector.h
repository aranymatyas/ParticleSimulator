#ifndef VECTOR_H
#define VECTOR_H

/// <summary>
/// Vector class used for representing physics related vector values, with X and Y coordinates
/// </summary>
class Vector {
public:
	///X coordinate of a vector
	float x;
	///Y coordinate of a vector
	float y;

	/// <summary>
	/// Constructor for vectors, usable as default constructor
	/// </summary>
	/// <param name="x">X coordinate</param>
	/// <param name="y">Y coordinate</param>
	Vector(float x = 0, float y = 0) : x(x), y(y) {}

	///Returns the X coordinate of a vector
	float getX() const { return x; }
	///Returns the Y coordinate of a vector
	float getY() const { return y; }
	///Returns the abs valuse of a vector
	float abs() const;

	/// <summary>
	/// Adds two vectors together
	/// </summary>
	Vector operator+(Vector const& rhs) const;

	/// <summary>
	/// Substracts two vectors
	/// </summary>
	Vector operator-(Vector const& rhs) const;

	/// <summary>
	/// Gives the distance between two vectors
	/// </summary>
	/// <param name="rhs">
	/// </param>
	/// <returns>
	/// Distance between the two points
	/// </returns>
	float operator%(Vector const& rhs) const;

	/// <summary>
	/// Returns the distance between two vectors
	/// </summary>
	float distance(Vector const& rhs) const { return this->operator%(rhs); }

	/// <summary>
	/// Multiplies vector by a float
	/// </summary>
	Vector operator*(float rhs) const;

	/// <summary>
	/// Divides vector by a float
	/// </summary>
	Vector operator/(float rhs) const;

	/// <summary>
	/// Divides vector by an int
	/// </summary>
	Vector operator/(int rhs) const;

	/// <summary>
	/// Divides vector by an unsigned int
	/// </summary>
	Vector operator/(unsigned int rhs) const;

	/// <summary>
	/// Multiplies vector by an int
	/// </summary>
	Vector operator*(int rhs) const;

	/// <summary>
	/// Multiplies vector by an unsigned int
	/// </summary>
	Vector operator*(unsigned int rhs) const;

	/// <summary>
	/// Checks if two vectors are close enough to each other
	/// </summary>
	bool operator==(const Vector& rhs) const;

	/// <summary>
	/// Rotates the vector
	/// </summary>
	/// <param name="phi">Angle to be rotated by</param>
	void rotate(double phi);
};

/// <summary>
/// Multiplies a vector by a float
/// </summary>
Vector operator*(const float& lhs, const Vector& rhs);


#endif
