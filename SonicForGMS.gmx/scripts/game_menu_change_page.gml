/// game_menu_change_page(menu, name)

var menu = argument0;
var name = argument1;

with (menu) {
    var page = game_menu_find_page(self, name);
    if (not is_undefined(page)) {
        var total = ds_list_size(pages);
        for (var n = 0; n < total; ++n) {
            pages[| n].enabled = false;
        }
        page.enabled = true;
        page.alarm[0] = 1;
        if (not page.remember) {
            page.selection = page.choices[| 0];
            page.index = 0;
            page.previous_index = undefined;
        }
    }
}
