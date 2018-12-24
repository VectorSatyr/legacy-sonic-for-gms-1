/// game_parallax_add_sprite_layer(sprite, subimg, subspd, ox, oy, [x_tiled], [y_tiled], [x_ratio], [y_ratio], [x_separation], [y_separation], [x_speed], [y_speed]);
// ---------------------------------------------------------------
/*  
**  Creates a new parallax sprite background with the given
**  properties.
**
**  Arguments:
**      sprite          Real; sprite index
**      subimg          Real; image index to start from
**      subspd          Real; speed to update image index
**      ox, oy          Real; absolute position of the
**                      background on screen
**      x_tiled         Boolean (Optional); whether to tile the
**                      background horizontally 
**      y_tiled         Boolean (Optional); whether to tile the
**                      background vertically
**      x_ratio         Real (Optional); factor to scroll the
**                      x-position against the view's x-position
**      y_ratio         Real (Optional); factor to scroll the
**                      y-position against the view's y-position
**      x_separation    Real (Optional); amount of horizontal
**                      space between tiled images
**      x_separation    Real (Optional); amount of vertical
**                      space between tiled images
**      x_speed         Real (Optional); horizontal speed the
**                      background will move automatically
**      y_speed         Real (Optional); vertical speed the
**                      background will move automatically
**  Returns:
**      Real (or undefined on error); instance index
**      of ParallaxLayer
*/
// ---------------------------------------------------------------
var x_tiled = false;
var y_tiled = false;
var x_ratio = 1;
var y_ratio = 1;
var x_separation = 0;
var y_separation = 0;
var x_speed = 0;
var y_speed = 0;
switch (argument_count) {
case 13: y_speed = argument[12];
case 12: x_speed = argument[11];
case 11: y_separation = argument[10];
case 10: x_separation = argument[9];
case 9: y_ratio = argument[8];
case 8: x_ratio = argument[7];
case 7: y_tiled = argument[6];
case 6: x_tiled = argument[5];
default:
    var oy = argument[4];
    var ox = argument[3];
    var subspd = argument[2];
    var subimg = argument[1];
    var sprite = argument[0];
}
// ---------------------------------------------------------------

with (instance_create(0, 0, ParallaxSpriteLayer)) {
    sprite_index = sprite;
    image_index = subimg;
    image_speed = subspd;
    x_absolute = ox;
    y_absolute = oy;
    tile_horizontal = x_tiled;
    tile_vertical = y_tiled;
    x_scroll = x_ratio;
    y_scroll = y_ratio;
    self.x_separation = x_separation;
    self.y_separation = y_separation;
    self.x_speed = x_speed;
    self.y_speed = y_speed;
    return id;
}

return undefined;
