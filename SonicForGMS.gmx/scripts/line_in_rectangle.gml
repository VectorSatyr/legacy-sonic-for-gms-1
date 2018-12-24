/// line_in_rectangle(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy2)
// ---------------------------------------------------------------
/*  
**  Checks if the given line crosses the given rectangle
**
**  Arguments:
**      sx1 real; line first point x-position
**      sy1 real; line first point y-position
**      sx2 real; line second point x-position
**      sy2 real; line second point y-position
**      dx1 real; rectangle top-left point x-position
**      dy1 real; rectangle top-left point y-position
**      dx2 real; rectangle bottom-right point x-position
**      dy2 real; rectangle bottom-right point y-position
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
var dx1 = argument4;
var dy1 = argument5;
var dx2 = argument6;
var dy2 = argument7;
// ---------------------------------------------------------------

var result = 0;

var p0 = point_in_rectangle(sx1, sy1, dx1, dy1, dx2, dy2);
var p1 = point_in_rectangle(sx2, sy2, dx1, dy1, dx2, dy2);

if (p0 and p1) {
    result = 1; // completely inside
} else if (p0 or p1) {
    result = 2; // overlap
} else if (line_in_line(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy1) or 
    line_in_line(sx1, sy1, sx2, sy2, dx1, dy1, dx1, dy2) or
    line_in_line(sx1, sy1, sx2, sy2, dx2, dy1, dx2, dy2) or
    line_in_line(sx1, sy1, sx2, sy2, dx1, dy2, dx2, dy2)) {
    result = 2; // overlap
}

return result;
