/// @description Insert description here
// You can write your code in this editor
// List of items in the store
store_items = ds_list_create();

// Add items: {name, price, type (e.g., skin/background)}
ds_list_add(store_items, ["Blue Blob", 50, "skin", spr_skinblue]);
ds_list_add(store_items, ["Orange Blob", 50, "skin", spr_skinorange]);
ds_list_add(store_items, ["Moustache Blob", 50, "skin", spr_skinmoustache]);
//ds_list_add(store_items, ["Starry Background", 200, "background"]);

var x_start = 50; // Starting X position for itemsss
var y_start = 80; // Starting Y position for items
var spacing = 210; // Vertical spacing between itemss

for (var i = 0; i < ds_list_size(store_items); i++) {
    var button_x = x_start + 400;
    var button_y = y_start + (i * spacing);

    // Create a Buy button for each item
    var btn = instance_create_layer(button_x, button_y, "instances", obj_buy_button);

    // Store the item's index in the button for later reference
    btn.item_index = i;
}