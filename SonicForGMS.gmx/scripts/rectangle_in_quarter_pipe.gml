/// rectangle_in_quarter_pipe(sx1, sy1, sx2, sy2, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given rectangle overlaps the given quarter pipe
**
**  Arguments:
**      sx1     real; rectangle top-left point x-position
**      sy1     real; rectangle top-left point y-position
**      sx2     real; rectangle bottom-right point x-position
**      sy2     real; rectangle bottom-right point y-position
**      cx      real; pipe centre point x-position
**      cy      real; pipe centre point y-position
**      xrad    real; pipe x-radius
**      yrad    real; pipe y-radius
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

var width = abs(xrad);
var height = abs(yrad);

var rectangle = rectangle_in_rectangle(sx1, sy1, sx2, sy2, cx, cy, cx + xrad, cy + yrad);
var ellipse = rectangle_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, width, height);

if (rectangle == 0 or ellipse == 1) {
    return 0;
}

if (ellipse == 0) {
    return rectangle;
}

if (rectangle == 1) {
    return 2; // overlap
}

if (rectangle_in_rectangle(cx, cy, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2) == 1) {
    return 2; // overlap
}

if (line_in_rectangle(cx + xrad, cy, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2) or
    line_in_rectangle(cx, cy + yrad, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2)) {
    return 2; // overlap
}

if (point_in_quarter_pipe(sx1, sy1, cx, cy, width, height) or
    point_in_quarter_pipe(sx1, sy2, cx, cy, width, height) or
    point_in_quarter_pipe(sx2, sy1, cx, cy, width, height) or
    point_in_quarter_pipe(sx2, sy2, cx, cy, width, height)) {
    return 2; // overlap
}

return 0;
