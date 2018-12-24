/// game_audio_fade_out(steps)

var steps = argument0;

var time = steps * 1000 / room_speed;

with (GMSGameMusic) {
    if (audio_is_playing(index) and audio_sound_get_gain(index) != 0) {
        audio_sound_gain(index, 0, time);
    }
}
