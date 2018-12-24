/// game_parallax_add_layer(back, left, top, width, height, ox, oy, [htile], [vtile], [hscroll], [vscroll], [hsep], [vsep], [hspd], [vspd]);
// ---------------------------------------------------------------
/*  
**  Creates a new parallax background with the given properties.
**
**  Arguments:
**      back            Real; background index
**      left, top       Real; top-left position of the
**                      area of the background to be drawn
**      width, height   Real; dimensions of the area of the
**                      backgrond to be drawn
**      ox, oy          Real; absolute position of the
**                      background on screen
**      htile, vtile    Boolean (Optional); whether to tile the
**                      background horizontally / vertically
**      hscroll         Real (Optional); factor to scroll the
**                      x-position against the view's x-position
**      vscroll         Real (Optional); factor to scroll the
**                      y-position against the view's y-position
**      hsep, vsep      Real (Optional); amount of space between
**                      tiled images
**      hspd, vspd      Real (Optional); automatic scroll speed
**
**  Returns:
**      Real (or undefined on error); instance index
**      of ParallaxLayer
*/
// ---------------------------------------------------------------
var htile = false;
var vtile = false;
var hscroll = 1;
var vscroll = 1;
var hsep = 0;
var vsep = 0;
var hspd = 0;
var vspd = 0;
switch (argument_count) {
case 15: vspd = argument[14];
case 14: hspd = argument[13];
case 13: ysep = argument[12];
case 12: hsep = argument[11];
case 11: vscroll = argument[10];
case 10: hscroll = argument[9];
case 9: vtile = argument[8];
case 8: htile = argument[7];
default:
    var oy = argument[6];
    var ox = argument[5];
    var height = argument[4];
    var width = argument[3];
    var top = argument[2];
    var left = argument[1];
    var back = argument[0];
}
// ---------------------------------------------------------------

with (instance_create(0, 0, ParallaxLayer)) {
    self.back = back;
    self.left = left;
    self.top = top;
    self.width = width;
    self.height = height;
    x_absolute = ox;
    y_absolute = oy;
    tile_horizontal = htile;
    tile_vertical = vtile;
    x_scroll = hscroll;
    y_scroll = vscroll;
    self.x_separation = hsep;
    self.y_separation = vsep;
    self.x_speed = hspd;
    self.y_speed = vspd;
    return id;
}

return undefined;
