/// game_input_event_map_button(channel, event, button)
// ---------------------------------------------------------------
/*  
**  Binds the given gamepad button to the given event so that it
**  registers to the given channel.
**
**  Arguments:
**      channel real; input channel to map to
**      event   string; event name to bind
**      button  real; gamepad button to bind
**              (see GameMaker documentation for more info)
**
**  Returns:
**      N/A
*/
// ---------------------------------------------------------------
var channel = argument0;
var event = argument1;
var button = argument2;
// ---------------------------------------------------------------
var exists = false;

with (Gamepad) {
    if (self.channel == channel) {
        exists = true;
        if (event == "") {
            ds_map_delete(buttons, button);
        } else {
            ds_map_replace(buttons, button, event);
        }
    }
}

if (not exists and event != "") {
    with (instance_create(0, 0, Gamepad)) {
        self.channel = channel;
        ds_map_replace(buttons, button, event);
    }
}
