/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(Font3);
draw_text(20, 20, "Coins: " + string(global.total_coins));

var x_start = 50; // Starting X position for the items
var y_start = 100; // Starting Y position for the items
var spacing = 200; // Vertical spacing between items
draw_set_font(Font1)

for (var i = 0; i < ds_list_size(store_items); i++) {
	draw_set_color(c_black);
    var item = ds_list_find_value(store_items, i); // Get the item array
    var name = item[0];
    var price = item[1];
	var sprite = item[3]; // Sprite for the skin

    // Draw the item details
    draw_text(x_start, y_start + (i * spacing), name + " - " + string(price));
	
	// Calculate the position for this item
    var item_x = x_start;
    var item_y = y_start + (i * spacing);


    // Draw the skin image
    if (sprite != -1) { // Ensure there's a sprite assigned
		draw_sprite_ext(sprite, 0, item_x + 100, item_y + 10, 1.5, 1.5,0,c_white,1);
    }

}
draw_flush()
    
