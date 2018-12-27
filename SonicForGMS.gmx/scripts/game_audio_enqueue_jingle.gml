/// game_audio_enqueue_jingle(soundid, [time], [fadetime], [priority], [loops])
// ---------------------------------------------------------------
/*
**  Starts music playback and queues it. The audio is managed by
**  an instance of Jingle; destroying this instance will
**  automatically cause the last queued music to start again.
**  (Jingle will automatically destroy itself after it has
**  finished playing; it will also fade in the previous music.)
**
**  Returns:
**      Real; instance index of Jingle.
*/
// ---------------------------------------------------------------
var time = -1;
var fadetime = 120;
var priority = 10;
var loops = false;
switch (argument_count) {
case 5: loops = argument[4];
case 4: priority = argument[3];
case 3: fadetime = argument[2];
case 2: time = argument[1];
default:
    var soundid = argument[0];
}
// ---------------------------------------------------------------

var music = instance_create(0, 0, GMSJingle);
music.soundid = soundid;
music.fade_time = fadetime;
music.priority = priority;
music.loops = loops;
if (time > -1) {
    music.time = time;
} else {
    music.time = audio_sound_length(soundid) * room_speed;
}
instance_perform_user_event(music, 0);

with (GameMusic) {
    if (next == -1 and id != music) {
        if (index != -1) {
            music.track_position = audio_sound_get_track_position(index);
            event_user(1);
        }
        next = music;
        music.previous = id;
    }
}

return music;
