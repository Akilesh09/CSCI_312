#ifndef BOX_H
#define BOX_H

#include "shape.h"
using namespace std;

class Box : public Shape {
private:
    double length;
    double width;
    double height;
    string tbcolor;

public:
    Box(string type, string color, string tbcolor, double length, double width, double height, Point loc);
    
    virtual double compute_volume();
    void print_color(void);
};

#endif
