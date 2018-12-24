/// game_save_all_emeralds_found([index])

var index = -1;
switch (argument_count) {
case 1: index = argument[0];
}

var found = false;

var file = game_save_find(index);
with (file) {
    found = (player_emeralds == power(2, total_emeralds) - 1);
}

return found;
