/// player_react_to_sticky_floor(ind, phase)

var ind = argument0;
var phase = argument1;

switch (phase) {
case "checking":
    if (ind.bottom_solid and game_pc_upper_in_shape(self, ind, y_radius) and
        y_speed <= ceiling_land_threshold) {
        var new_mask_dir = angle_wrap(mask_direction + 180);
        var new_dir = game_pc_calc_shape_normal(self, ind, new_mask_dir);
        var diff = angle_difference(new_mask_dir, new_dir);
        if (in_range(abs(diff), 45, 90)) {
            game_pc_react_to(self, ind);
        }
    }
    break;

case "entering":
    game_pc_land(self, ceiling_id);
    game_pc_redirect(self, new_dir);
    game_pc_align(self, new_mask_dir);
    break;

case "exiting":
    break;
}
