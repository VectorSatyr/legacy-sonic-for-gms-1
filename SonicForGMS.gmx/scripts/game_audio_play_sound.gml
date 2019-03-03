/// game_audio_play_sound(soundid, [priority], [loops])
/**
 * @description Starts sound playback (Stops all previous instances of the sound before playing)
 * @argument {real} soundid sound index
 * @argument {real} priority (optional) channel priority; lower priority sounds may be cut off
 * @argument {boolean} loops (optional) whether or not the music repeats indefinitely
 * @returns {real} index of played audio (-1 on error)
 */

var priority = 0;
var loops = false;
switch (argument_count) {
case 3: var loops = argument[2];
case 2: var priority = argument[1];
default:
    var soundid = argument[0];
}

var index = -1;

with (GMSAudioSystem) {
    if (audio_is_playing(soundid)) {
        audio_stop_sound(soundid);
    }
    index = audio_play_sound(soundid, priority, loops);
    audio_sound_gain(index, volume_sound, 0);
    if (instance_exists(PausedScreen)) {
        audio_pause_sound(index);
    }
}

return index;
