/// game_sign_add_moment(ind, duration, delay, xpos, ypos, xscale, yscale, rot, color, alpha)

var ind = argument0;
var duration = argument1;
var delay = argument2;
var xpos = argument3;
var ypos = argument4;
var xscale = argument5;
var yscale = argument6;
var rot = argument7;
var color = argument8;
var alpha = argument9;

with (ind) {
    ds_list_add(moment_duration, duration);
    ds_list_add(moment_delay, delay);
    ds_list_add(moment_x, xpos);
    ds_list_add(moment_y, ypos);
    ds_list_add(moment_xscale, xscale);
    ds_list_add(moment_yscale, yscale);
    ds_list_add(moment_angle, rot);
    ds_list_add(moment_blend, color);
    ds_list_add(moment_alpha, alpha);
    ++moment_count;
}
