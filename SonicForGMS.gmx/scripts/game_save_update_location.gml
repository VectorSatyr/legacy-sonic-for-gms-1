/// game_save_update_location([location], [index])

var index = -1;
var location = room;
switch (argument_count) {
case 2: index = argument[1];
case 1: location = argument[0];
}

var file = game_save_find(index);
with (file) {
    self.location = location;
}
