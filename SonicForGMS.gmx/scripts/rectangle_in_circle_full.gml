/// rectangle_in_circle_full(sx1, sy1, sx2, sy2, cx, cy, rad)
// ---------------------------------------------------------------
/*  
**  Checks if the given rectangle overlaps the given circle
**  (handles more edge cases than rectangle_in_circle)
**
**  Arguments:
**      sx1 real; rectangle top-left point x-position
**      sy1 real; rectangle top-left point y-position
**      sx2 real; rectangle bottom-right point x-position
**      sy2 real; rectangle bottom-right point y-position
**      cx  real; circle centre point x-position
**      cy  real; circle centre point y-position
**      rad real; circle radius
**
**  Returns:
**      Boolean
**
** source: http://math.stackexchange.com/a/243525
*/
// ---------------------------------------------------------------
var sx1 = argument0;
var sy1 = argument1;
var sx2 = argument2;
var sy2 = argument3;
var cx = argument4;
var cy = argument5;
var rad = argument6;
// ---------------------------------------------------------------

var circle = rectangle_in_circle(sx1, sy1, sx2, sy2, cx, cy, rad);

if (circle != 0) {
    return circle; // source is in destination
}

if (point_in_rectangle(cx, cy, sx1, sy1, sx2, sy2)) {
    return 2; // destination is in source
}

if (line_in_circle(sx1, sy1, sx2, sy1, cx, cy, rad) or
    line_in_circle(sx1, sy1, sx1, sy2, cx, cy, rad) or
    line_in_circle(sx2, sy1, sx2, sy2, cx, cy, rad) or
    line_in_circle(sx1, sy2, sx2, sy2, cx, cy, rad)) {
    return 2; // overlapping by edge
}

return 0;
