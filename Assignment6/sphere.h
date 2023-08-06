#ifndef SPHERE_H
#define SPHERE_H

#include "shape.h"
using namespace std;

class Sphere : public Shape {
private:
    Point center;
    double radius;

public:
    Sphere(string type, string color, Point center, double radius);

    virtual double compute_volume();
};

#endif
