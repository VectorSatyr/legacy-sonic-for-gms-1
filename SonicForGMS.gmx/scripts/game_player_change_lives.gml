/// game_player_change_lives(player, amount)

var player = argument0;
var amount = argument1;

with (player) {
    var count = life_count;
    game_player_set_lives(self, life_count + amount);
    if (life_count != count) {
        if (sign(amount) > 0) {
            instance_create(0, 0, LifeUpJingle);
        }
    }
}
