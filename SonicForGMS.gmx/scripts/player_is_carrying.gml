/// player_is_carrying(phase)

var phase = argument0;

switch (phase) {
case "start":
    if (on_the_ground) {
        ground_id = noone;
        on_the_ground = false;

        game_pc_translate_speed(self, x_speed, local_direction);
        game_pc_redirect(self, gravity_direction);
        game_pc_align(self, gravity_direction);
    }

    spinning = false;

    flight_force = flight_base_force;

    game_pc_animate(self, "carry");
    game_pc_camera_direct(self, game_pc_camera_state_aerial);
    break;

case "finish":
    if (audio_is_playing(flight_soundid)) {
        audio_stop_sound(flight_soundid);
    }
    if (instance_exists(linked_object_id)) {
        game_pc_perform(linked_object_id, player_is_falling);
        linked_object_id = noone;
    }
    break;

case "step":
    if (not instance_exists(linked_object_id)) {
        linked_object_id = noone;
        return game_pc_perform(self, player_is_flying);
    }
/*
    if (linked_object_id.input_action_pressed and
        linked_object_id.input_down) {
        game_pc_perform(linked_object_id, player_is_falling);
        return game_pc_perform(self, player_is_flying);
    }
*/
    with (linked_object_id) {
        other.input_action_pressed = input_action_pressed;
        other.horizontal_axis_value = horizontal_axis_value;
    }

    if (input_action_pressed and flight_time and 
        y_speed >= flight_threshold) {
        flight_force = -flight_ascend_force;
    }

    if (horizontal_axis_value != 0) {
        facing_sign = horizontal_axis_value;
        if (abs(x_speed) < speed_cap or sign(x_speed) != horizontal_axis_value) {
            x_speed += air_acceleration * horizontal_axis_value;
            if (abs(x_speed) > speed_cap and sign(x_speed) == horizontal_axis_value) {
                x_speed = speed_cap * horizontal_axis_value;
            }
        }
    }

    game_pc_move_in_air(self);
    if (state_changed) {
        return false;
    }

    if (on_the_ground) {
        game_pc_perform(linked_object_id, player_is_falling);
        if (x_speed != 0) {
            return game_pc_perform(self, player_is_running);
        } else {
            return game_pc_perform(self, player_is_standing);
        }
    }

    if (underwater and flight_time > 0) {
        flight_time = 0;
    }

    game_pc_position(linked_object_id, x, y + flight_link_offset);
    game_pc_move_in_air(linked_object_id);
    if (not linked_object_id.state_changed) {
        if (linked_object_id.on_the_ground) {
            if (linked_object_id.x_speed != 0) {
                game_pc_perform(linked_object_id, player_is_running);
            } else {
                game_pc_perform(linked_object_id, player_is_standing);
            }
            return game_pc_perform(self, player_is_flying);
        }

        game_pc_find_wall(linked_object_id, x_wall_radius + 1);
        if (linked_object_id.wall_id != noone) {
            if (sign(x_speed) == sign(linked_object_id.wall_sign)) {
                x_speed = 0; // stop if moving towards wall
                game_pc_position(self, linked_object_id.x, y);
            }
        }

        linked_object_id.facing_sign = facing_sign;
    }

    if (y_speed < 0 and y_speed > -jump_release_force) {
        if (abs(x_speed) > air_friction_threshold) {
            x_speed *= air_friction;
        }
    }

    y_speed += flight_force;

    if (y_speed < flight_threshold or ceiling_id != noone) {
        flight_force = flight_base_force;
    }

    if (flight_time > 0) {
        flight_time--;
    }

    if (flight_time) {
        if (y_speed < 0) {
            game_pc_animate(self, "carry_rise");
        } else {
            game_pc_animate(self, "carry");
        }
        if (not audio_is_playing(FlightSound)) {
            audio_stop_sound(flight_soundid);
            flight_soundid = game_pc_play_sound(self, FlightSound, true);
        }
    } else {
        if (underwater) {
            game_pc_animate(self, "swim_carry_fall");
            if (audio_is_playing(flight_soundid)) {
                audio_stop_sound(flight_soundid);
            }
        } else {
            game_pc_animate(self, "carry_fall");
            if (not audio_is_playing(FlightFallSound)) {
                audio_stop_sound(flight_soundid);
                flight_soundid = game_pc_play_sound(self, FlightFallSound, 0);
            }
        }
    }
    break;
}
