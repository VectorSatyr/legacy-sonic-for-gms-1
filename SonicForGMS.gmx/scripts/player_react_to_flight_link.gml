/// player_react_to_flight_link(ind, phase)

var ind = argument0;
var phase = argument1;

switch (phase) {
case "checking":
    if (not on_the_ground and y_speed > 0 and 
        game_pc_upper_in_shape(self, ind, y_radius * 0.5)) {
        game_pc_react_to(self, ind);
    }
    break;

case "entering":
    if (state != player_is_linked or linked_object_id != ind) {
        game_pc_perform(self, player_is_linked);
        game_pc_position(self, ind.x, ind.y);
        game_pc_animate(self, "hang");
        game_pc_play_sound(self, ClaspingSound);
        spinning = false;
        linked_object_id = ind;
        x_speed = 0;
        y_speed = 0;

        var link = ind.source;
        game_pc_perform(link, player_is_carrying);
        link.linked_object_id = self;
    }
    break;

case "exiting":
    break;
}
