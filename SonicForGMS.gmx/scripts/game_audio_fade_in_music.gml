/// game_audio_fade_in_music(steps, [music])
/**
 * @description Fades in the given sound over the given number of steps
 * @argument {real} steps total steps to fade
 * @argument {real} music (optional) instance index of GameMusic
 */

var music = game_audio_current_music();
switch (argument_count) {
case 2: music = argument[1];
default:
    steps = argument[0];
}

var time = steps * 1000 / room_speed;

if (instance_exists(music)) {
    with (GMSAudioSystem) {
        audio_sound_gain(music.index, 0, 0);
        audio_sound_gain(music.index, volume_music, time);
    }
}
