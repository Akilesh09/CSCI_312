#ifndef SHAPE_H
#define SHAPE_H

#include <string>
#include "point.h"

class Shape {
private:
    std::string type;
    Point loc;

protected:
    std::string color;

public:
    Shape* next;
    
    Shape(std::string type, std::string color, Point loc);
    virtual ~Shape();

    virtual void print_color();
    virtual double compute_volume() = 0;

    void print_type();
    void print_loc();

    
    void set_type(std::string type);
    void set_color(std::string color);
    void set_location(Point loc);

    std::string get_type();
};

#endif // SHAPE_H

