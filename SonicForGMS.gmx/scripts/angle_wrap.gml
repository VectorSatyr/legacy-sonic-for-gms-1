/// angle_wrap(ang)
// ---------------------------------------------------------------
/*  
**  Returns 'ang' wrapped between 0 and 359 degrees.
**
**  Arguments:
**      ang real; angle to check
**
**  Returns:
**      Boolean
*/
// ---------------------------------------------------------------
var ang = argument0;
// ---------------------------------------------------------------

if (ang < 0) {
    return (ang mod 360) + 360;
}

return ang mod 360;
