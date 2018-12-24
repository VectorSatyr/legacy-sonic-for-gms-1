/// game_audio_play_music(soundid, [priority], [loops])
// ---------------------------------------------------------------
/*
**  Starts music playback.
**
**  Returns:
**      Real; index of played audio.
*/
// ---------------------------------------------------------------
var priority = 0;
var loops = false;
switch (argument_count) {
case 3: var loops = argument[2];
case 2: var priority = argument[1];
default:
    var soundid = argument[0];
}
// ---------------------------------------------------------------

var index = -1;

with (AudioSystem) {
    if (audio_is_playing(soundid)) {
        audio_stop_sound(soundid);
    }
    index = audio_play_sound(soundid, priority, loops);
    audio_sound_gain(index, volume_music, 0);
    if (instance_exists(PausedScreen)) {
        audio_pause_sound(index);
    }
}

return index;
