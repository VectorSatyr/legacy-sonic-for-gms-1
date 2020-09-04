/// game_pc_camera_state_peelout(vind)

var vind = argument0;

if (abs(look_x_distance) < look_distance_down) {
    look_x_distance += 2 * sign(owner.facing_sign);
}

game_pc_camera_state_common(vind);
