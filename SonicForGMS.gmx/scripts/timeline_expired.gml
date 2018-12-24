/// timeline_expired(obj)

var obj = argument0;

var result = false;

with (obj) {
    if (timeline_position >= timeline_max_moment(timeline_index)) {
        result = true;
    }
}

return result;
