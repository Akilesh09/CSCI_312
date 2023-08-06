#include "shape.h"
#include <iostream>

using namespace std;

Shape::Shape(string type, string color, Point loc)
    : type(type), color(color), loc(loc), next(NULL) {}

Shape::~Shape() {}

// Print Functions
void Shape::print_color() {
    cout << "Color: " << color << endl;
}

void Shape::print_type() {
    cout << "Type: " << type << endl;
}

void Shape::print_loc() {
    cout << "Location: ";
    loc.print();
}

// Setter functions
void Shape::set_type(string type) {
    this->type = type;
}

void Shape::set_color(string color) {
    this->color = color;
}

void Shape::set_location(Point loc) {
    this->loc = loc;
}

// Returns what shape an object is
// Function added to check if object is a cone to fix a formatting issue in the output
string Shape::get_type(){
    return (this->type);
}
