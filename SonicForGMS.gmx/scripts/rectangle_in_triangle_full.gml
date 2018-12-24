/// rectangle_in_triangle_full(sx1, sy1, sx2, sy2, x1, y1, x2, y2, x3, y3)
// ---------------------------------------------------------------
/*  
**  Checks if the given rectangle overlaps the given triangle
**  (handles more edge cases than rectangle_in_triangle)
**
**  Arguments:
**      sx1 real; rectangle top-left point x-position
**      sy1 real; rectangle top-left point y-position
**      sx2 real; rectangle bottom-right point x-position
**      sy2 real; rectangle bottom-right point y-position
**      x1  real; triangle first point x-position
**      y1  real; triangle first point y-position
**      x2  real; triangle second point x-position
**      y2  real; triangle second point y-position
**      x3  real; triangle third point x-position
**      y3  real; triangle third point y-position
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
var x1 = argument4;
var y1 = argument5;
var x2 = argument6;
var y2 = argument7;
var x3 = argument8;
var y3 = argument9;
// ---------------------------------------------------------------

var triangle = rectangle_in_triangle(sx1, sy1, sx2, sy2, x1, y1, x2, y2, x3, y3);

if (triangle != 0) {
    return triangle; // source is in destination
}

if (point_in_rectangle(x1, y1, sx1, sy1, sx2, sy2) or
    point_in_rectangle(x2, y2, sx1, sy1, sx2, sy2) or
    point_in_rectangle(x3, y3, sx1, sy1, sx2, sy2)) {
    return 2; // destination is in source
}

if (line_in_rectangle(x1, y1, x2, y2, sx1, sy1, sx2, sy2) or
    line_in_rectangle(x2, y2, x3, y3, sx1, sy1, sx2, sy2) or
    line_in_rectangle(x1, y1, x3, y3, sx1, sy1, sx2, sy2)) {
    return 2; // overlapping by edge
}

return 0;
