/// game_audio_enqueue_music_fmod(soundid)
/**
 * @description Starts music playback and 'queues' it using an instance of FMODGameMusic; destroying this instance will automatically cause the last 'queued' music to start again
 * @argument {real} soundid sound index
 * @returns {real} instance index of FMODGameMusic
 */

var soundid = argument0;

var music = instance_create(0, 0, FMODGameMusic);
music.soundid = soundid;
instance_perform_user_event(music, 0);

with (GameMusic) {
    if (id != music and next == noone) {
        event_user(1);
        next = music;
        music.previous = id;
    }
}

return music;
