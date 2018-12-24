/// rectangle_in_object(x1, y1, x2, y2, obj, prec, notme)
// ---------------------------------------------------------------
/*  
**  Checks if the given rectangle crosses the given object
**
**  Arguments:
**      x1      real; rectangle top-left point x-position
**      y1      real; rectangle top-left point y-position
**      x2      real; rectangle bottom-right point x-position
**      y2      real; rectangle bottom-right point y-position
**      obj     real; object or instance index
**      prec    boolean; whether or not to use precise collision
**              checking
**      notme   boolean; whether the calling instance is
**              included in the search
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
var obj = argument4;
var prec = argument5;
var notme = argument6;
// ---------------------------------------------------------------

var p0 = (collision_point(x1, y1, obj, prec, notme) != noone);
var p1 = (collision_point(x1, y2, obj, prec, notme) != noone);
var p2 = (collision_point(x2, y1, obj, prec, notme) != noone);
var p3 = (collision_point(x2, y2, obj, prec, notme) != noone);

if (p0 and p1 and p2 and p3) {
    return 1; // completely inside
}
else if (p0 or p1 or p2 or p3) {
    return 2; // overlap
}

if (collision_rectangle(x1, y1, x2, y2, obj, prec, notme) != noone) {
    return 2; // overlap
}

return 0;
