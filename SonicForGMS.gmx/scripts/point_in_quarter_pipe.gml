/// point_in_quarter_pipe(px, py, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given point lines within the given quarter
**  pipe
**
**  Arguments:
**      px      real; point x-position
**      py      real; point y-position
**      cx      real; ellipse centre point x-position
**      cy      real; ellipse centre point y-position
**      xrad    real; ellipse x radius
**      yrad    real; ellipse y radius
**
**  Returns:
**      Boolean
**
*/
// ---------------------------------------------------------------
var px = argument0;
var py = argument1;
var cx = argument2;
var cy = argument3;
var xrad = argument4;
var yrad = argument5;
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

var rectangle = point_in_rectangle(px, py, dx1, dy1, dx2, dy2);
var ellipse = point_in_ellipse(px, py, cx, cy, abs(xrad), abs(yrad));

return (rectangle and not ellipse);
