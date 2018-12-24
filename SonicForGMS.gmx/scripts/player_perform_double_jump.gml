/// player_perform_double_jump()
jump_action_available = false;

y_speed = -5.5;

with (SpriteParticles) {
    part_type_speed(lightning_spark, 2, 2, 0, 0);
    part_type_direction(lightning_spark, 180, 180, 0, 0);
    part_particles_create(system, other.x_int, other.y_int, lightning_spark, 1);

    part_type_speed(lightning_spark, 2, 2, 0, 0);
    part_type_direction(lightning_spark, 0, 0, 0, 0);
    part_particles_create(system, other.x_int, other.y_int, lightning_spark, 1);

    part_type_speed(lightning_spark, 2.8, 2.8, 0, 0);
    part_type_direction(lightning_spark, 225, 225, 0, 0);
    part_particles_create(system, other.x_int, other.y_int, lightning_spark, 1);

    part_type_speed(lightning_spark, 2.8, 2.8, 0, 0);
    part_type_direction(lightning_spark, 315, 315, 0, 0);
    part_particles_create(system, other.x_int, other.y_int, lightning_spark, 1);
}

game_pc_play_sound(self, DoubleJumpSound);
