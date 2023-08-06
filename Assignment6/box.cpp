#include "box.h"
#include <iostream>
using namespace std;

Box::Box(string type, string color, string tbcolor, double length, double width, double height, Point loc)
    : Shape(type, color, loc), tbcolor(tbcolor), length(length), width(width), height(height) {}

double Box::compute_volume() {
    return length * width * height;
}

// Overrides the print_color function in Shape because box has a tbcolor as well
void Box::print_color (void) {
    cout << "Side Color: " << color << " Top/Base Color: " << tbcolor << endl;
}
