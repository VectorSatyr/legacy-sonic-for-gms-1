/// game_zone_get_total_rings()
var rings = undefined;

with (GameZone) {
    if (not is_undefined(total_ring_count)) {
        rings = total_ring_count;
    }
}

return rings;
