/// rectangle_in_quarter_ellipse(sx1, sy1, sx2, sy2, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given rectangle overlaps the given quarter
**  ellipse
**
**  Arguments:
**      sx1     real; rectangle top-left point x-position
**      sy1     real; rectangle top-left point y-position
**      sx2     real; rectangle bottom-right point x-position
**      sy2     real; rectangle bottom-right point y-position
**      cx      real; ellipse centre point x-position
**      cy      real; ellipse centre point y-position
**      xrad    real; ellipse x-radius
**      yrad    real; ellipse y-radius
**
**  Returns:
**      Boolean
**
*/
// ---------------------------------------------------------------
var sx1 = argument0;
var sy1 = argument1;
var sx2 = argument2;
var sy2 = argument3;
var cx = argument4;
var cy = argument5;
var xrad = argument6;
var yrad = argument7;
// ---------------------------------------------------------------

var dx1 = cx;
var dy1 = cy;
var dx2 = cx + xrad;
var dy2 = cy + yrad;
if (dx1 > dx2) {
    dx1 = cx + xrad;
    dx2 = cx;
}
if (dy1 > dy2) {
    dy1 = cy + yrad;
    dy2 = cy;
}

var rectangle = rectangle_in_rectangle(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy2);
var ellipse = rectangle_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, abs(xrad), abs(yrad));

if (rectangle == 0 or ellipse == 0) {
    return 0;
}
if (rectangle == 2 or ellipse == 2) {
    return 2; // overlap
}

return 1; // completely inside
