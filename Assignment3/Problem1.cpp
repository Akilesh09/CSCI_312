#include <iostream>
using namespace std;

int a = 6;

int f (int y) {
	static int z = 3;
	cout << "A" << " a:" << a << " y:" << y << " z:" << z << endl;
	
	if (!y) {
		y++;
		a = f(y);
	}

	z += 1;
	cout << "B" << " a:" << a << " y:" << y << " z:" << z << endl;
	return z;
}

int main () {
	int x = 0;
	int y = 0;
	int z = 1;
	cout << "C" << " a:" << a << " x:" << x << " y:" << y << " z:" << z << endl;
	
	x = f(y);
	cout << "D" << " a:" << a << " x:" << x << " y:" << y << " z:" << z << endl;
	
	y = f(a);
	cout << "E" << " a:" << a << " x:" << x << " y:" << y << " z:" << z << endl;
}
