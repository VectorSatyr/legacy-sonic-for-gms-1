/// game_menu_add_page(menu, page)

var menu = argument0;
var page = argument1;

if (instance_exists(menu) and instance_exists(page)) {
    page.owner = menu;
    ds_list_add(menu.pages, page);
    if (ds_list_size(menu.pages) <= 1) {
        page.enabled = true;
    }
}
