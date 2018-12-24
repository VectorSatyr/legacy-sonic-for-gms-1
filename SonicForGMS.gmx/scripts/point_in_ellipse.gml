/// point_in_ellipse(px, py, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given point lines within the given ellipse
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
** source: http://math.stackexchange.com/a/243525
*/
// ---------------------------------------------------------------
var px = argument0;
var py = argument1;
var cx = argument2;
var cy = argument3;
var xrad = argument4;
var yrad = argument5;
// ---------------------------------------------------------------

var intersect = false;

if (xrad == yrad) {
    intersect = point_in_circle(px, py, cx, cy, xrad);
} else {
    var qx = px - cx;
    var qy = py - cy;

    if (xrad > yrad) {
        // scale to x-radius
        intersect = point_in_circle(qx, qy * (xrad / yrad), 0, 0, xrad);
    } else {
        // scale to y-radius
        intersect = point_in_circle(qx * (yrad / xrad), qy, 0, 0, yrad);
    }
}

return intersect;
