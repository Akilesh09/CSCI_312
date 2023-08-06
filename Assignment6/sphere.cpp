#include "sphere.h"
#include <cmath>
#include <iostream>
using namespace std;

Sphere::Sphere(string type, string color, Point center, double radius)
    : Shape(type, color, center), center(center), radius(radius) {}

double Sphere::compute_volume() {
    return (4.0 / 3.0) * 3.141519 * radius * radius * radius;
}
