/// game_pc_find_ground(character, radius)

var character = argument0;
var radius = argument1;

with (character) {
    ground_id = noone;

    var ind;
    for (var oy = 0; oy < radius; ++oy) {
        ind = game_pc_lower_collision_solid(self, oy);
        if (ind != noone) {
            var distance = (y_radius - oy) + 1;
            var sine = dsin(mask_direction);
            var cosine = dcos(mask_direction);
            game_pc_position(self, x - (sine * distance), y - (cosine * distance));
            ground_id = ind;
            on_the_ground = true;
            game_pc_redirect(self, game_pc_calc_shape_normal(self, ind, mask_direction));
            game_pc_find_outlier(self);
            break;
        }
    }
}
