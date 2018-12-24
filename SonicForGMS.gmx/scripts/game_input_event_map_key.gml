/// game_input_event_map_key(event, key)
// ---------------------------------------------------------------
/*  
**  Binds the given keyboard key to the given event. (Keyboard
**  events are always registered on input channel 0)
**
**  Arguments:
**      event   string; event name to bind
**      key     real; keyboard key to bind
**              (see GameMaker documentation for more info)
**
**  Returns:
**      N/A
*/
// ---------------------------------------------------------------
var event = argument0;
var key = argument1;
// ---------------------------------------------------------------
if (not instance_exists(Keyboard)) {
    instance_create(0, 0, Keyboard);
}

with (Keyboard) {
    if (event == "") {
        ds_map_delete(buttons, key);
    } else {
        ds_map_replace(buttons, key, event);
    }
}
