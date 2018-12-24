/// game_player_change_score(player, amount)

var player = argument0;
var amount = argument1;

with (player) {
    var count = score_count;
    game_player_set_score(self, score_count + amount);
    if (score_count != count) {
        if (sign(amount) > 0 and score_per_life > 0) {
            var change = (score_count mod score_per_life) + amount;
            if (change >= score_per_life) {
                game_player_change_lives(self, change div score_per_life);
            }
        }
    }
}
