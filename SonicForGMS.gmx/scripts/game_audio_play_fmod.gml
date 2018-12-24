/// game_audio_play_fmod(soundid, [loops])
// ---------------------------------------------------------------
/*
**  Starts FMOD sound playback.
**
**  Returns:
**      Real; index of played audio.
*/
// ---------------------------------------------------------------
var loops = false;
switch (argument_count) {
case 2: var loops = argument[1];
default:
    var soundid = argument[0];
}
// ---------------------------------------------------------------

var index = -1;

with (FMODAudioSystem) {
    index = ds_map_find_value(sounds, soundid);
    if (not is_undefined(index)) {
        if (index > -1) {
            FMODGMS_Snd_Set_LoopMode(index, loops, -1);
            FMODGMS_Snd_PlaySound(index, channel);
            if (instance_exists(PausedScreen)) {
                FMODGMS_Chan_PauseChannel(channel);
            }
        }
    }
}

return index;
