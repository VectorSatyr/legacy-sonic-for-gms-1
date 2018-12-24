/// game_audio_fmod_add_sound(name)

var name = argument0;

with (FMODAudioSystem) {
    if (ds_map_exists(sounds, name)) {
        FMODGMS_Snd_Unload(sounds[? name]);
    }
    sounds[? name] = FMODGMS_Snd_LoadSound(working_directory + "Audio/" + name);
}
