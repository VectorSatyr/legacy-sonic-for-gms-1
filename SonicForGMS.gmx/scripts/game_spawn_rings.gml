/// game_spawn_rings(rings, ox, oy)
/*
Spawns a circle(s) of dropped rings at the given coordinates

> rings: number of dropped rings to create
> x, y: center position from which the circle(s) is formed

< return value: n/a
*/

// ---------------------------------------------------------------
var rings = argument0;
var ox = argument1;
var oy = argument2;
// ---------------------------------------------------------------

if (rings > 32) {
    rings = 32;
}

var len = 4;
var dir = 101.25;
var flip = false;

for (var ring = 0; ring < rings; ++ring) {
    if (ring == 16) {
        len = 2;
        dir = 101.25;
    }
    with (instance_create(ox, oy, LostRing)) {
        depth = other.depth + 1;
        x_speed = lengthdir_x(len, dir);
        y_speed = lengthdir_y(len, dir);
        if (flip) {
            x_speed = -x_speed;
            dir += 22.5;
        }
    }
    flip = !flip;
}
