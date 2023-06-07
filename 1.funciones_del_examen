/* Quadratic equation with test for discriminant. */
#include <stdio.h>
#include <math.h>
int main(void)
{
    double a,b,c,discriminant,root1,root2,LIMIT=1e-6;

    printf("Enter coefficients for ax^2+bx+c: ");
    scanf("%lf %lf %lf" , &a , &b , &c);
    discriminant=b*b- 4.0 * a * c;
    printf("discriminant = %lf \n" ,discriminant);
    if (discriminant > LIMIT ) {
        root1=(- b + sqrt(discriminant)) / 2.0 / a;
        root2=(- b - sqrt(discriminant)) / 2.0 / a;
        printf("root1 = %lf, root2 = %lf\n" ,root1,root2);
    }
    else if (fabs(discriminant) <= LIMIT) {
        root1=-b/2.0/a;
        root2=0.0;
        printf("The single real root = %lf\n" ,root1);
    }
    else
        printf("There are no real roots.\n");
        root1=0.0;
        root2=0.0;
        return 0;
}
