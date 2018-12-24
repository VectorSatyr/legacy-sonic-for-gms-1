/// game_start_location_record(ox, oy, [epoch], [location])

var epoch = game_clock_get_step();
var location = room;
switch (argument_count) {
case 4: location = argument[3];
case 3: epoch = argument[2];
default:
    var oy = argument[1];
    var ox = argument[0];
}

instance_destroy(PlayerEntrance);
with (instance_create(ox, oy, PlayerEntrance)) {
    self.location = location;
    self.epoch = epoch;
}
