/// game_pc_camera_state_aerial(vind)

var vind = argument0;

view_hspeed = x_speed * (freeze_time <= 0);
view_vspeed[vind] = min(min_y_speed + abs(y - yprevious), y_speed);
view_vborder[vind] = (view_hview[vind] * 0.5) - y_border;

game_pc_camera_state_common(vind);
