/// rectangle_in_view(x1, y1, x2, y2, vind)
// ---------------------------------------------------------------
/*
**  Checks if the given rectangle crosses the given view port
**
**  Arguments:
**      x1      real; rectangle top-left point x-position
**      y1      real; rectangle top-left point y-position
**      x2      real; rectangle bottom-right point x-position
**      y2      real; rectangle bottom-right point y-position
**      vind    real; view port
**
**  Returns:
**      Real; 0: no intersect; 1: completely inside;
**      2: overlapping
*/
// ---------------------------------------------------------------
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var vind = argument4;
// ---------------------------------------------------------------

if (view_exists(vind)) {
    var vx1 = view_xview[vind];
    var vy1 = view_yview[vind];
    var vx2 = vx1 + view_wview[vind];
    var vy2 = vy1 + view_hview[vind];
    return rectangle_in_rectangle(x1, y1, x2, y2, vx1, vy1, vx2, vy2);
}

return 0;
