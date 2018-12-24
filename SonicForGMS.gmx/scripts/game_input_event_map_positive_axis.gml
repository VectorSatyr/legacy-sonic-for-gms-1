/// game_input_event_map_positive_axis(channel, event, axis)
// ---------------------------------------------------------------
/*  
**  Binds the given gamepad axis to the given event so that it
**  registers to the given channel whenever it is positive.
**
**  Arguments:
**      channel real; input channel to map to
**      axis    real; gamepad axis to bind
                (see GameMaker documentation for more info)
**      event   string; event name to bind
**
**  Returns:
**      N/A
*/
// ---------------------------------------------------------------
var channel = argument0;
var event = argument1;
var axis = argument2;
// ---------------------------------------------------------------

var exists = false;

with (Gamepad) {
    if (self.channel == channel) {
        exists = true;
        if (event == "") {
            ds_map_delete(axes_positive, axis);
        } else {
            ds_map_replace(axes_positive, axis, event);
        }
    }
}

if (not exists and event != "") {
    with (instance_create(0, 0, Gamepad)) {
        self.channel = channel;
        ds_map_replace(axes_positive, axis, event);
    }
}
