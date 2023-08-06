#include <iostream>
#include "shape.h"
#include "sphere.h"
#include "box.h"
#include "cone.h"

using namespace std;

void read_objs(Shape** list) {
    Shape* node; // Variable used to create a new node each time through the loop
    // Temporary variables used to store input
    double x, y, z, xx, yy, zz, radius, length, width, height; 
    string type, color, color2;

    // initialize list
    *list = NULL;
    cout << "Objects:" << endl << endl;
    
    //First determines what type of shape is being inputted, it takes the corresponding input an creates an instance of that shape
    while (cin >> type) {
        if (type.compare("sphere") == 0) {
            cin >> x >> y >> z >> radius >> color;
            node = new Sphere(type, color, Point(x, y, z), radius);
        } else if (type.compare("box") == 0) {
            cin >> length >> width >> height >> x >> y >> z >> color >> color2;
            node = new Box(type, color, color2, length, width, height, Point(x, y, z));
        } else if (type.compare("cone") == 0) {
            cin >> x >> y >> z >> xx >> yy >> zz >> radius >> color >> color2;
            node = new Cone(type, color, color2, Point(x, y, z), Point(xx, yy, zz), radius);
        }

        
        node->next = *list;

                *list = node;
    }
}

void print_objs(Shape* list) {
    Shape* current = list;
    
    while(current != NULL){
        current->print_type();
        current->print_color();
	//Due to a formatting issue when printing cones, a new line has to be added
	if(current->get_type() == "cone"){
		cout << endl;
	}
        current->print_loc();
        cout << "Volume: " << current->compute_volume() << endl << endl;

        //Iterates the next shape
        current = current->next;
}
}
int main() {
    Shape* list = NULL;
    read_objs(&list);
    print_objs(list);

    // Loop here to deallocate any allocated space to the system
    while (list != NULL) {
        Shape* temp = list;
        list = list->next;
        delete temp;
    }
    return 0;
}
