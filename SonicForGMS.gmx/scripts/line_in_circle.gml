/// line_in_circle(sx1, sy1, sx2, sy2, cx, cy, rad)
// ---------------------------------------------------------------
/*  
**  Checks if the given line crosses the given circle
**
**  Arguments:
**      sx1 real; first line first point x-position
**      sy1 real; first line first point y-position
**      sx2 real; first line second point x-position
**      sy2 real; first line second point y-position
**      cx  real; circle centre point x-position
**      cy  real; circle centre point y-position
**      rad real; circle radius
**
**  Returns:
**      Real; 0: no intersect; 1: completely inside;
**      2: overlapping
**
** source: http://paulbourke.net/geometry/pointlineplane/
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

var result = 0;

var p0 = point_in_circle(sx1, sy1, cx, cy, rad);
var p1 = point_in_circle(sx2, sy2, cx, cy, rad);

if (p0 and p1) {
    result = 1; // complete inside
} else if (p0 or p1) {
    result = 2; // overlap
} else {
    var sx = sx2 - sx1;
    var sy = sy2 - sy1;

    var length = abs(sqr(sx) + sqr(sy));

    if (length != 0) {
        var p = dot_product(cx - sx1, cy - sy1, sx, sy) / length;

        if (p >= 0 and p <= 1 and point_in_circle(sx1 + (sx * p), sy1 + (sy * p), cx, cy, rad)) {
            result = 2; // overlap
        }
    }
}

return result;
