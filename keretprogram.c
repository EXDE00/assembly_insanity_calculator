#include <stdio.h>


extern int calculator(int lhs, int rhs, char op[]);

int main () {
	int lhs;
	int rhs;
	char *op;
	int result;

	printf("Enter the left number: ");
	scanf("%d", &lhs);
	printf("Enter the op: ");
	scanf("%s", op);
	printf("Enter the right number: ");
	scanf("%d", &rhs);
	printf("\nThe result is: ");
	result = calculator(lhs, rhs, op);
	
	printf("%d %s %d -> %d\n", lhs, op, rhs, result);
	return 0;
}
