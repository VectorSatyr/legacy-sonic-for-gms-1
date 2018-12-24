/// line_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given line crosses the given ellipse
**
**  Arguments:
**      sx1     real; first line first point x-position
**      sy1     real; first line first point y-position
**      sx2     real; first line second point x-position
**      sy2     real; first line second point y-position
**      cx      real; ellipse centre point x-position
**      cy      real; ellipse centre point y-position
**      xrad    real; ellipse x-radius
**      yrad    real; ellipse y-radius
**
**  Returns:
**      Real; 0: no intersect; 1: completely inside;
**      2: overlapping
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

var result = 0;

if (xrad == yrad) {
    result = line_in_circle(sx1, sy1, sx2, sy2, cx, cy, xrad);
} else {
    var rx = sx1 - cx;
    var ry = sy1 - cy;
    var sx = sx2 - cx;
    var sy = sy2 - cy;
    var s;
    
    if (xrad > yrad) {
        // scale to x-radius
        s = xrad / yrad;
        result = line_in_circle(rx, ry * s, sx, sy * s, 0, 0, xrad);
    } else {
        // scale to y-radius
        s = yrad / xrad;
        result = line_in_circle(rx * s, ry, sx * s, sy, 0, 0, yrad);
    }
}

return result;
