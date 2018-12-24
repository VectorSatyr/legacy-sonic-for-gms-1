/// game_console_reset()
// ---------------------------------------------------------------
/*
**  Resets the game (stats, options, etc.) without closing the
**  program.
**
**  Returns:
**      N/A
*/
// ---------------------------------------------------------------

// save the game
game_save_write_all();
game_console_show_message("GAME SAVED");

// reset stats
game_start_location_reset();
with (GamePlayer) {
    game_player_set_score(self, 0);
    game_player_set_rings(self, 0);
    lives_via_rings = 0;
}

// return to title screen
room_goto(SplashScreenRoom);
