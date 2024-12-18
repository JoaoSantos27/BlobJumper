/// @description Insert description here
// You can write your code in this editor
// Skin Selection
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(Font3);
for (var i = 0; i < ds_list_size(global.unlocked_skins); i++) {
    var skin_sprite = ds_list_find_value(global.unlocked_skins, i);
    draw_sprite_ext(skin_sprite, 0, x_start, y_skins + (i * 220), 1.5, 1.5,0,c_white,1);
	
    if (i == selected_skin_index) {
        draw_text(x_start, y_skins - 25  + (i * 220), "Selected");
    }
}

// Toggle Button
var button_x = x_start + 300;
var button_y = y_skins + 50;
var button_width = 390;
var button_height = 100;

// Draw button
draw_set_color(c_white);
draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, false);

draw_set_color(c_black);
draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, true);
draw_text(button_x + 10, button_y + 15, global.tutorial_skin ? "Tutorial ON" : "Tutorial OFF");

// Background Selection
//var y_backgrounds = 300; // Y position for backgrounds
//for (var i = 0; i < ds_list_size(global.unlocked_backgrounds); i++) {
//    var bg_name = ds_list_find_value(global.unlocked_backgrounds, i);
//    var bg_sprite = asset_get_index(bg_name);

//    draw_sprite(bg_sprite, 0, x_start + (i * 100), y_backgrounds);
//    if (i == selected_background_index) {
//        draw_text(x_start + (i * 100), y_backgrounds + 50, "Selected");
//    }
//}
draw_flush()