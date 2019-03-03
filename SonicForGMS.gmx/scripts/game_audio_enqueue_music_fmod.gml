/// game_audio_enqueue_music_fmod(name, [loops])
/**
 * @description Starts music playback and 'queues' it using an instance of FMODGameMusic; destroying this instance will automatically cause the last 'queued' music to start again
 * @argument {real} soundid sound index
 * @argument {boolean} loops (optional) whether or not the music repeats indefinitely
 * @returns {real} instance index of FMODGameMusic
 */

var loops = false;
switch (argument_count) {
case 2: var loops = argument[1];
default:
    var soundid = argument[0];
}

var music = instance_create(0, 0, FMODGameMusic);
music.soundid = soundid;
music.loops = loops;
instance_perform_user_event(music, 0);

with (GameMusic) {
    if (id != music and next == noone) {
        event_user(1);
        next = music;
        music.previous = id;
    }
}

return music;
