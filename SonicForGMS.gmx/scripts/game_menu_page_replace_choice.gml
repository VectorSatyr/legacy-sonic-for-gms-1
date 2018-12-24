/// game_menu_page_replace_choice(page, choice, index)

var page = argument0;
var choice = argument1;
var index = argument2;

if (instance_exists(page) and instance_exists(choice)) {
    if (index > -1 and index < ds_list_size(page.choices)) {
        choice.owner = page;
        choice.index = index;
        choice.selected = page.choices[| index].selected;
        instance_destroy(page.choices[| index]);
        page.choices[| index] = choice;
        if (choice.selected) {
            page.selection = choice;
        }
    }
}
