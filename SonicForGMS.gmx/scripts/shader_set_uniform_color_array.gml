/// shader_set_uniform_color_array(uniform_id, colors)

var uniform_id = argument0;
var colors = argument1;

var size = array_length_1d(colors);
var array = array_create(size * 3);
var offset;
for (var row = 0; row < size; ++row) {
    offset = row * 3;
    array[offset] = color_get_red(colors[row]) / 256;
    array[offset + 1] = color_get_green(colors[row]) / 256;
    array[offset + 2] = color_get_blue(colors[row]) / 256;
}

shader_set_uniform_f_array(uniform_id, array);
