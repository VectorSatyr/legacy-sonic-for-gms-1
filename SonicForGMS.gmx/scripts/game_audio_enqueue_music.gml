/// game_audio_enqueue_music(soundid, [priority], [loops])
// ---------------------------------------------------------------
/*
**  Starts music playback and queues it. The audio is managed by
**  an instance of GameMusic; destroying this instance will
**  automatically cause the last queued music to start again.
**
**  Returns:
**      Real; instance index of GameMusic.
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

var music = instance_create(0, 0, GMSGameMusic);
music.soundid = soundid;
music.priority = priority;
music.loops = loops;
instance_perform_user_event(music, 0);

with (GameMusic) {
    if (next == -1 and id != music) {
        event_user(1);
        next = music;
        music.previous = id;
    }
}

return music;
