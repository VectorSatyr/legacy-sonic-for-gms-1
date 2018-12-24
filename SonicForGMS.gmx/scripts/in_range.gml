/// in_range(n, a, b)
// ---------------------------------------------------------------
/*
**  Checks if the given value (n) is between the minimum (a) and
**  the maximum (b), exclusively
**
**  Arguments:
**      n   real; value to evaluate
**      a   real; minimum value
**      b   real; maximum value
**
**  Returns:
**      Boolean
*/
// ---------------------------------------------------------------
var n = argument0;
var a = argument1;
var b = argument2;
// ---------------------------------------------------------------
var result = false;

if (n > a and n < b) {
    result = true;
}

return result;
