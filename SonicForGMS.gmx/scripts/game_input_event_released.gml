/// game_input_event_released(event, [channel?])
// ---------------------------------------------------------------
/*  
**  Checks if the given event was registered last frame and not
**  this frame.
**
**  Arguments:
**      event   string; event name to check
**      channel real (optional); input channel to verify against;
**              if unused, all channels will be polled
**
**  Returns:
**      Boolean (or undefined on error)
*/
// ---------------------------------------------------------------
var channel = -1;
switch (argument_count) {
case 2: channel = argument[1];
default:
    var event = argument[0];
}
// ---------------------------------------------------------------

with (InputSource) {
    if (channel == -1 or self.channel == channel) {
        if (ds_list_find_index(events, event) == -1 and ds_list_find_index(previous_events, event) != -1) {
            return true;
        }
    }
}

return false;
