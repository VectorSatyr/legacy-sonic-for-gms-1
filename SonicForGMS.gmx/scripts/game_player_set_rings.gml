/// game_player_set_rings(player, amount)

var player = argument0;
var amount = argument1;

with (player) {
    var count = rings;
    rings = clamp(amount, 0, max_rings_count);
    if (rings != count) {
        with (display) {
            post_rings.label = string(other.rings);
            rings_warning = (other.rings <= 0);
        }
    }
}
