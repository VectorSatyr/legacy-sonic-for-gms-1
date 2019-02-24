/// view_centre(vind, ox, oy)
/**
 * @description Centers the given view at the given point, taking the room boundaries into consideration
 * @argument {real} vind view port
 * @argument {real} ox focal point x-position
 * @argument {real} oy focal point y-position
 */

var vind = argument0;
var ox = argument1;
var oy = argument2;

if (view_exists(vind)) {
    view_xview[vind] = clamp(ox - (view_wview[vind] * 0.5), 0, room_width - view_wview[vind]);
    view_yview[vind] = clamp(oy - (view_hview[vind] * 0.5), 0, room_height - view_hview[vind]);
}
