/// view_follow(vind, ox, oy)
/**
 * @description Moves the specified view as if view_object[vind] were set to an instance at point {ox, oy}
 * @argument {real} vind view port
 * @argument {real} ox focal point x-position
 * @argument {real} oy focal point y-position
 */

var vind = argument0;
var ox = argument1;
var oy = argument2;

if (view_exists(vind)) {
    // calculate centre point
    var cx = view_xview[vind] + (view_wview[vind] * 0.5);
    var cy = view_yview[vind] + (view_hview[vind] * 0.5);
    
    // calculate offset from centre point
    var ocx = ox - cx;
    var ocy = oy - cy;
    
    // limit to view border
    var hborder = (view_wview[vind] * 0.5) - view_hborder[vind];
    var vborder = (view_hview[vind] * 0.5) - view_vborder[vind];
    ocx = max(abs(ocx) - hborder, 0) * sign(ocx);
    ocy = max(abs(ocy) - vborder, 0) * sign(ocy);
    
    // limit movement speed
    if (view_hspeed[vind] > -1 and abs(ocx) > view_hspeed[vind]) {
        ocx = view_hspeed[vind] * sign(ocx);
    }
    if (view_vspeed[vind] > -1 and abs(ocy) > view_vspeed[vind]) {
        ocy = view_vspeed[vind] * sign(ocy);
    }
    
    // move the view
    if (ocx != 0) {
        view_xview[vind] = clamp(view_xview[vind] + ocx, 0, room_width - view_wview[vind]);
    }
    if (ocy != 0) {
        view_yview[vind] = clamp(view_yview[vind] + ocy, 0, room_height - view_hview[vind]);
    }
}
