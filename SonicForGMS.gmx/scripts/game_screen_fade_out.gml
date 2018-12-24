/// game_screen_fade_out(shader, steps, [next_room])

var next_room = -1;
switch (argument_count) {
case 3: next_room = argument[2];
default:
    var steps = argument[1];
    var shader = argument[0];
}

var fade = instance_create(0, 0, FadeOut);
fade.image_speed = 3.0 / steps;
fade.shader = shader;
fade.next_room = next_room;

return fade;
