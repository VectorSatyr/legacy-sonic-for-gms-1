/// game_save_complete([index])

var index = -1;
switch (argument_count) {
case 1: index = argument[0];
}

var file = game_save_find(index);
with (file) {
    complete = true;
}
