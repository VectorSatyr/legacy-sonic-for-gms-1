/// instance_perform_user_event(inst, index)

var inst = argument0;
var index = argument1;

if (in_range(index, -1, MAX_USER_EVENTS)) {
    with (inst) {
        event_user(index);
    }
}
