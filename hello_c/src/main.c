#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "year_utils.h"


int main(int argc, char *argv[])
{
    if( argc < 2 )
    {
        printf("Too few arguments supplied.\n");  
    }
    else if( argc > 2 )
    {
        printf("Too many arguments supplied.\n");
    }
    else
    {
        int year = atoi(argv[1]);
        if (is_even(year))
        {
            printf("%d is even \n", year);
        }
        if (is_leap_year(year))
        {
            printf("%d is a leap year \n", year);
        }
        else
        {
            printf("%d is NOT a leap year \n", year);
        }    
    }
    return 0;
}