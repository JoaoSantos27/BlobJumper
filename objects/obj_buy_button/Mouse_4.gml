/// @description Insert description here
// You can write your code in this editor
// Assuming the item index is stored in a variable `item_index` in the shop controller
if (!is_purchased) {
var item = ds_list_find_value(obj_storecontroller.store_items, item_index);
var price = item[1];
var name = item[0];
var sprite = item[3];

if (global.total_coins >= price) {
    global.total_coins -= price;
    show_message("You bought: " + name);

    // Save purchase
	is_purchased = true;
    if (item[2] == "skin") {
        ds_list_add(global.unlocked_skins, sprite);
	} else if (item[2] == "background") {
        ds_list_add(global.unlocked_backgrounds, sprite);
    }
	save();
} else {
    show_message("Not enough coins!");
}
}