/// game_save_select_current(index)
/**
 * @description Changes which save 'slot' is considered the current 'slot'
 * @argument {real} index save 'slot' to target
 */

var index = argument0;

with (GameSaveDirectory) {
    self.index = index;
}
