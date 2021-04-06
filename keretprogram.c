#include <stdio.h>


extern int calculator(int lhs, int rhs, char op[]);

int main () {
	int lhs = 1;
	int rhs = 4;
	char *op = "-";
	int result;

	result = calculator(lhs, rhs, op);
	
	printf("%d %s %d -> %d\n", lhs, op, rhs, result);
	return 0;
}
