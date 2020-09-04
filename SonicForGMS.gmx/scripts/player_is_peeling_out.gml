/// player_is_peeling_out(phase)

var phase = argument0;

switch (phase) {
case "start":
    spinning = false;

    peelout_charge = 0;

    game_pc_camera_direct(self, game_pc_camera_state_peelout);

    game_pc_animate(self, "walk");
    image_angle = gravity_direction;

    game_pc_play_sound(self, PeeloutChargeSound);

    with (instance_create(x, y, PlayerDashSmoke)) {
        image_xscale = other.facing_sign;
        source = other.id;
    }
    break;

case "finish":
    peelout_charge = 0;
    break;

case "step":
    game_pc_move_on_ground(self);
    if (state_changed) {
        return false;
    }

    if (not on_the_ground or (local_direction >= 90 and local_direction <= 270)) {
        return game_pc_perform(self, player_is_falling);
    }

    if (mask_direction != gravity_direction) {
        control_lock_time = default_slide_lock_time;
        return game_pc_perform(self, player_is_running);
    }

    if ( x_speed != 0) {
        return game_pc_perform(self, player_is_running);
    }

    if (not input_up or horizontal_axis_value != 0) {
        if (peelout_charge >= peelout_charge_time) {
            x_speed = facing_sign * peelout_release_speed;
            game_pc_play_sound(self, PeeloutDashSound);
            return game_pc_perform(self, player_is_running);
        } else if (peelout_charge <= peelout_charge_time / 2) {
            return game_pc_perform(self, player_is_standing);
        }
    }

    if (peelout_charge < peelout_charge_time) {
        ++peelout_charge;
    }

    var relative_speed = peelout_speed / peelout_charge_time;
    var velocity = floor(abs(peelout_charge * relative_speed));
    if (velocity >= peelout_speed) {
        game_pc_animate(self, "peelout");
    } else if (velocity >= 6) {
        game_pc_animate(self, "run");
    } else {
        game_pc_animate(self, "walk");
    }
    timeline_speed = 1 / max(8 - velocity, 1);
    break;
}
