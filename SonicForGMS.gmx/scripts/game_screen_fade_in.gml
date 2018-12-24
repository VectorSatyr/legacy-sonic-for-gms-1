/// game_screen_fade_in(shader, steps)

var shader = argument0;
var steps = argument1;

var fade = instance_create(0, 0, FadeIn);
fade.image_speed = 3.0 / steps;
fade.shader = shader;

return fade;
