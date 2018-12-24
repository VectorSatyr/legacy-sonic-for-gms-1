/// game_window_update_ports([total])
with (GameWindow) {
    if (argument_count == 1) {
        ports = argument[0];
    }
    event_user(1); // reframe
}
