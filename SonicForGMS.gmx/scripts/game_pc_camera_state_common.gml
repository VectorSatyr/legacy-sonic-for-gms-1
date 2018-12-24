/// game_pc_camera_state_common(vind)

var vind = argument0;

var sine = dsin(gravity_direction);
var cosine = dcos(gravity_direction);
var ox = x + (look_x_distance * cosine) + (look_y_distance * sine);
var oy = y - (look_x_distance * sine) + (look_y_distance * cosine);

view_follow(vind, ox, oy);

view_xview[vind] = clamp(view_xview[vind], bound_left, bound_right - view_wview[vind]);
view_yview[vind] = clamp(view_yview[vind], bound_top, bound_bottom - view_hview[vind]);
