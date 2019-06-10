/// game_pc_super_available(character)

var character = argument0;

var result = false;

if (game_save_all_emeralds_found(game_save_current())) {
    with (character) {
        if (owner.rings >= 50 and 
            not (superform or recovery_time > 0 or invincibility_time > 0)) {
            result = true;
        }
    }
}

return result;
