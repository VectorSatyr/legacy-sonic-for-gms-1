/// game_console_show_message(text, [duration], [separation])
/**
 * @description Shows a brief console message
 * @argument {string} text message to display
 * @argument {real} duration (optional) number of frames to show the message
 * @argument {real} separation (optional) space between separate messages in pixels
 * @returns {real} instance index of GameConsoleMessage
 */

var duration = 120;
var separation = 2;
switch (argument_count) {
case 3: separation = argument[2];
case 2: duration = argument[1];
default:
    var text = argument[0];
}

var message = instance_create(display_get_gui_width() - 4, display_get_gui_height() - 14, GameConsoleMessage);
message.text = text;
message.alarm[0] = duration;

with (GameConsoleMessage) {
    draw_set_font(font);
    if (id != message) {
        y -= (string_height(self.text) + self.separation);
        if (next == -1) {
            next = message;
            message.previous = id;
        }
    }
}

show_debug_message(text);

return message;
