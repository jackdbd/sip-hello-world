#include <stdbool.h>
#include "year_utils.h"

/* function definitions */

bool is_leap_year(int year) {
    bool is_leap;
    if(year%4 == 0)
    {
        if( year%100 == 0)
        {
            if ( year%400 == 0)
                is_leap = true;
            else
                is_leap = false;
        }
        else
            is_leap = true;
    }
    else
        is_leap = false;
    return is_leap; 
}

bool is_even(int year) {
    if(year%2 == 0)
        return true;
    else
        return false;
}