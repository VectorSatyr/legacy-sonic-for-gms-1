/// line_in_triangle(sx1, sy1, sx2, sy2, x1, y1, x2, y2, x3, y3)
// ---------------------------------------------------------------
/*  
**  Checks if the given line crosses the given triangle
**
**  Arguments:
**      sx1 real; line first point x-position
**      sy1 real; line first point y-position
**      sx2 real; line second point x-position
**      sy2 real; line second point y-position
**      x1  real; triangle first point x-position
**      y1  real; triangle first point y-position
**      x2  real; triangle second point x-position
**      y2  real; triangle second point y-position
**      x3  real; triangle third point x-position
**      y3  real; triangle third point y-position
**
**  Returns:
**      Real; 0: no intersect; 1: completely inside;
**      2: overlapping
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

var result = 0;

var p0 = point_in_triangle(sx1, sy1, x1, y1, x2, y2, x3, y3);
var p1 = point_in_triangle(sx2, sy2, x1, y1, x2, y2, x3, y3);

if (p0 and p1) {
    result = 1; // completely inside
} else if (p0 or p1) {
    result = 2; // overlap
} else if (line_in_line(sx1, sy1, sx2, sy2, x1, y1, x2, y2) or
    line_in_line(sx1, sy1, sx2, sy2, x2, y2, x3, y3) or
    line_in_line(sx1, sy1, sx2, sy2, x1, y1, x3, y3)) {
    result = 2; // overlap
}

return result;
