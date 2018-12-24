/// instance_on_screen([padding])

var padding = 0;
switch (argument_count) {
case 1: padding = argument[0];
}

var result = false;

if (view_enabled) {
    var x1 = x - padding;
    var y1 = y - padding;
    var x2 = x + padding;
    var y2 = y + padding;
    for (var vind = 0; vind < max_view_count; ++vind) {
        if (view_visible[vind] and rectangle_in_view(x1, y1, x2, y2, vind)) {
            result = true;
            break;
        }
    }
} else {
    result = true; // whole room is visible
}

return result;
