/// game_player_set_score(player, amount)

var player = argument0;
var amount = argument1;

with (player) {
    var count = score_count;
    score_count = clamp(amount, 0, MAX_SCORE_COUNT);
    if (score_count != count) {
        with (display) {
            post_score.label = string(other.score_count);
        }
    }
}
