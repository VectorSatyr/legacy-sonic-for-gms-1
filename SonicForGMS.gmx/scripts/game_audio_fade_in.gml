/// game_audio_fade_in(music, steps)

var music = argument0;
var steps = argument1;

var time = steps * 1000 / room_speed;

with (AudioSystem) {
    if (audio_is_playing(music.index) and audio_sound_get_gain(music.index) != 0) {
        audio_sound_gain(music.index, 0, 0);
        audio_sound_gain(music.index, volume_music, time);
    }
}
