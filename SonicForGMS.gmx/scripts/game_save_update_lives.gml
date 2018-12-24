/// game_save_update_lives(player, [index])

var index = -1;
switch (argument_count) {
case 2: index = argument[1];
default:
    var player = argument[0];
}

var file = game_save_find(index);
with (file) {
    player_lives = max(player.life_count, default_life_count);
}
