#include "vector.h"
#include "window.h"
#include <cmath>

float Vector::abs() const
{
	return sqrt(x * x + y * y);
}

Vector Vector::operator+(Vector const& rhs) const
{
	return Vector(x + rhs.x, y + rhs.y);
}

Vector Vector::operator-(Vector const& rhs) const
{
	return Vector(x - rhs.x, y - rhs.y);
}

float Vector::operator%(Vector const& rhs) const
{
	return sqrt((x - rhs.x) * (x - rhs.x) + (y - rhs.y) * (y - rhs.y));
}

Vector Vector::operator*(float rhs) const
{
	return Vector(x * rhs, y * rhs);
}

Vector operator*(const float& lhs, const Vector& rhs)
{
	return rhs * lhs;
}

Vector Vector::operator/(float rhs) const
{
	if (rhs == 0) throw "Vector division by zero!";
	return *this * (1 / rhs);
}

bool Vector::operator==(const Vector& rhs) const
{
	return std::fabs(x - rhs.x) < epsilon && std::fabs(y - rhs.y) < epsilon;
}

void Vector::rotate(double phi)
{
	double newx, newy;
	newx = cos(phi) * x - sin(phi) * y;
	newy = sin(phi) * x + cos(phi) * y;
	x = static_cast<float>(newx);
	y = static_cast<float>(newy);
}

Vector Vector::operator/(int rhs) const
{
	if (rhs == 0) throw "Vector division by zero!";
	return *this * (1 / static_cast<float>(rhs));
}

Vector Vector::operator*(int rhs) const
{
	return *this * static_cast<float>(rhs);
}

Vector Vector::operator*(unsigned int rhs) const
{
	return *this * static_cast<float>(rhs);
}

Vector Vector::operator/(unsigned int rhs) const
{
	return *this / static_cast<float>(rhs);
}