/// game_menu_find_page(menu, name)

var menu = argument0;
var name = argument1;

with (menu) {
    var total = ds_list_size(pages);
    for (var index = 0; index < total; ++index) {
        if (pages[| index].name == name) {
            return pages[| index];
        }
    }
}

return undefined;
