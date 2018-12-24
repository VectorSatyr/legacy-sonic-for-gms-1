/// game_save_find(index)

var index = argument0;

var file = noone;

with (GameSaveFile) {
    if (self.index == index) {
        file = id;
        break;
    }
}

return file;
