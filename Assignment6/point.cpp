#include "point.h"
#include <cmath>
#include <iostream>
using namespace std;

Point::Point() : x(0.0), y(0.0), z(0.0) {}

Point::Point(double x, double y, double z) {
    set(x, y, z);
}

void Point::set(double x, double y, double z) {
    this->x = x;
    this->y = y;
    this->z = z;
}

double Point::length() {
    return sqrt(x * x + y * y + z * z);
}

Point Point::operator-(Point& p) {
    Point result;
    result.x = this->x - p.x;
    result.y = this->y - p.y;
    result.z = this->z - p.z;
    return result;
}

void Point::print() {
    cout << "x: " << x << " y: " << y << " z: " << z << endl;
}
