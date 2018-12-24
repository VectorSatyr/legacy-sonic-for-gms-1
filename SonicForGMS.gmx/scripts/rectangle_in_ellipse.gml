/// rectangle_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given rectangle overlaps the given ellipse
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
** source: http://math.stackexchange.com/a/243525
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

var ellipse = 0;

if (xrad == yrad) {
    ellipse = rectangle_in_circle_full(sx1, sy1, sx2, sy2, cx, cy, xrad);
} else {
    var rx = sx1 - cx;
    var ry = sy1 - cy;
    var sx = sx2 - cx;
    var sy = sy2 - cy;
    var s;
    
    if (xrad > yrad) {
        // scale to x-radius
        s = xrad / yrad;
        ellipse = rectangle_in_circle_full(rx, ry * s, sx, sy * s, 0, 0, xrad);
    } else {
        // scale to y-radius
        s = yrad / xrad;
        ellipse = rectangle_in_circle_full(rx * s, ry, sx * s, sy, 0, 0, yrad);
    }
}

if (ellipse != 0) {
    return ellipse; // source is in destination
}

if (point_in_rectangle(cx, cy, sx1, sy1, sx2, sy2)) {
    return 2; // destination is in source
}

if (line_in_ellipse(sx1, sy1, sx2, sy1, cx, cy, xrad, yrad) or
    line_in_ellipse(sx1, sy1, sx1, sy2, cx, cy, xrad, yrad) or
    line_in_ellipse(sx2, sy1, sx2, sy2, cx, cy, xrad, yrad) or
    line_in_ellipse(sx1, sy2, sx2, sy2, cx, cy, xrad, yrad)) {
    return 2; // overlapping by edge
}

return 0;
