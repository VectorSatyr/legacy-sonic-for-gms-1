/// game_pc_find_cliff(character)

var character = argument0;

with (character) {
    cliff_sign = 0;

    var total = ds_list_size(local_solids);
    var left = noone;
    var right = noone;
    
    var sine = dsin(mask_direction);
    var cosine = dcos(mask_direction);

    var radius = y_radius + y_snap_distance;
    var ind;

    for (var n = 0; n < total; ++n) {
        ind = local_solids[| n];
        if (instance_exists(ind)) {
            if (ind.top_solid) {
                if (game_pc_leg_in_shape(self, ind, 0, radius)) {
                    break;
                }
                if (left == noone and game_pc_leg_in_shape(self, ind, -x_radius, radius)) {
                    left = ind;
                }
                if (right == noone and game_pc_leg_in_shape(self, ind, x_radius, radius)) {
                    right = ind;
                }
            }
        }
        if (left != noone xor right != noone) {       
            if (left) {
                cliff_sign = 1;
                break;
            }
            if (right) {
                cliff_sign = -1;
                break;
            }
        } else {
            break;
        }
    }
}
