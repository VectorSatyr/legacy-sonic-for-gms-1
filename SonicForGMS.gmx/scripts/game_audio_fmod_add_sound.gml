/// game_audio_fmod_add_sound(fname)
/**
 * @description Loads an audio file with the given name from the "Audio" directory for use later
 * @argument {real} fname audio filename
 */

var fname = argument0;

with (FMODAudioSystem) {
    if (ds_map_exists(sounds, fname)) {
        FMODGMS_Snd_Unload(sounds[? fname]);
    }
    sounds[? fname] = FMODGMS_Snd_LoadSound(working_directory + "Audio/" + fname);
}
