/// game_pc_find_ceiling(character, radius)

var character = argument0;
var radius = argument1;

with (character) {
    ceiling_id = noone;

    var ind;
    for (var oy = 0; oy < radius; ++oy) {
        ind = game_pc_upper_collision_solid(self, oy);
        if (ind != noone) {
            var distance = (y_radius - oy) + 1;
            var sine = dsin(mask_direction);
            var cosine = dcos(mask_direction);
            game_pc_position(self, x + (sine * distance), y + (cosine * distance));
            ceiling_id = ind;
            break;
        }
    }

    if (ceiling_id != noone) {
        if (ceiling_id.sticky and y_speed <= ceiling_land_threshold) {
            var new_mask_dir = angle_wrap(mask_direction + 180);
            var new_dir = game_pc_calc_shape_normal(self, ceiling_id, new_mask_dir);
            var diff = angle_difference(new_mask_dir, new_dir);
            if (in_range(abs(diff), 45, 90)) {
                game_pc_land(self, ceiling_id);
                game_pc_redirect(self, new_dir);
                game_pc_align(self, new_mask_dir);
                ceiling_id = noone;
            }
        }
    }

    if (ceiling_id != noone) {
        // slide against the ceiling
        var new_mask_dir = angle_wrap(mask_direction + 180);
        var new_dir = game_pc_calc_shape_normal(self, ceiling_id, new_mask_dir);
        var dir = new_dir - gravity_direction;
        game_pc_translate_speed(self, (dcos(dir) * x_speed) - (dsin(dir) * y_speed), dir);
    }
}

/*
var character = argument0;
var radius = argument1;

with (character) {
    ceiling_id = noone;
    var ind;
    
    for (var oy = 0; oy < radius; ++oy) {
        ind = game_pc_upper_collision_solid(self, oy);
        if (ind != noone) {
            var distance = (y_radius - oy) + 1;
            var sine = dsin(mask_direction);
            var cosine = dcos(mask_direction);
            game_pc_position(self, x + (sine * distance), y + (cosine * distance));
            ceiling_id = ind;
            break;
        }
    }

    if (ceiling_id != noone) {
        var new_mask_direction = angle_wrap(mask_direction + 180);
        var new_direction = game_pc_calc_shape_normal(self, ceiling_id, new_mask_direction);
        var difference = angle_difference(new_mask_direction, new_direction);
        if (ceiling_id.ceiling_land_enabled and y_speed <= ceiling_land_threshold and
            abs(difference) > 45 and abs(difference) < 90) {
            ground_id = ceiling_id;
            ceiling_id = noone;
            on_the_ground = true;
            game_pc_redirect(self, new_direction);
            game_pc_align(self, new_mask_direction);
        } else {
            var dir = new_direction - gravity_direction;
            game_pc_translate_speed(self, (dcos(dir) * x_speed) - (dsin(dir) * y_speed), dir);
        }
    }
}
