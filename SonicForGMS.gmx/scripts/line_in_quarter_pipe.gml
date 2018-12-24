/// line_in_quarter_pipe(sx1, sy1, sx2, sy2, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given line crosses the given ellipse pipe
**
**  Arguments:
**      sx1     real; first line first point x-position
**      sy1     real; first line first point y-position
**      sx2     real; first line second point x-position
**      sy2     real; first line second point y-position
**      cx      real; pipe centre point x-position
**      cy      real; pipe centre point y-position
**      xrad    real; pipe x-radius
**      yrad    real; pipe y-radius
**
**  Returns:
**      Real; 0: no intersect; 1: completely inside;
**      2: overlapping
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

var result = 0;

var width = abs(xrad);
var height = abs(yrad);

var rectangle = line_in_rectangle(sx1, sy1, sx2, sy2, cx, cy, cx + xrad, cy + yrad);
var ellipse = line_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, width, height);

if (rectangle != 0 and ellipse != 1) {
    if (ellipse == 0) {
        result = rectangle;
    } else if (rectangle == 1) {
        result = 2; // overlap
    } else if (line_in_line(cx + xrad, cy, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2) or
        line_in_line(cx, cy + yrad, cx + xrad, cy + yrad, sx1, sy1, sx2, sy2)) {
        result = 2; // overlap
    } else if (point_in_quarter_pipe(sx1, sy1, cx, cy, width, height) or
        point_in_quarter_pipe(sx2, sy2, cx, cy, width, height)) {
        result = 2; // overlap
    }
}

return result;
