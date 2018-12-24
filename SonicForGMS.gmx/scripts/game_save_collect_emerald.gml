/// game_save_collect_emerald(emeraldIndex, [index])

var index = -1;
switch (argument_count) {
case 2: index = argument[1];
default:
    var emeraldIndex = argument[0];
}

var file = game_save_find(index);
with (file) {
    player_emeralds |= (1 << emeraldIndex);
}
