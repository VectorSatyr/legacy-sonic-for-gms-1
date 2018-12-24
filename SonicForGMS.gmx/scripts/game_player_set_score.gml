/// game_player_set_score(player, amount)

var player = argument0;
var amount = argument1;

with (player) {
    var count = score_count;
    score_count = clamp(amount, 0, max_score_count);
    if (score_count != count) {
        with (display) {
            post_score.label = string(other.score_count);
        }
    }
}
