/// game_pc_camera_state_grounded(vind)

var vind = argument0;

view_hspeed[vind] = x_speed * (freeze_time <= 0);
view_vspeed[vind] = min(min_y_speed + abs(y - yprevious), y_speed);
view_vborder[vind] = (view_hview[vind] * 0.5);

game_pc_camera_state_common(vind);
