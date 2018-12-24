/// shader_set_uniform_color(uniform_id, color)

var uniform_id = argument0;
var color = argument1;

var red = color_get_red(color) / 256;
var green = color_get_green(color) / 256;
var blue = color_get_blue(color) / 256;

shader_set_uniform_f(uniform_id, red, green, blue);
