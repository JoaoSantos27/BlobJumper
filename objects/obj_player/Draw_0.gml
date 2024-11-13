/// @description Insert description here
// You can write your code in this editor

draw_sprite(sprite_index, image_index, x, y);

var camera_y = camera_get_view_y(view_camera[0]);
var score_display_y = camera_y + 10;

draw_set_font(Font1);
draw_text(10, score_display_y, "Score: " + string(score));
draw_text(10, score_display_y + 30, "Coins: " + string(coins_collected)); 
draw_text(10, score_display_y + 60, "Fruits: " + string(fruits_collected)); 

// Set positions for icons
var icon_x = 450;
var icon_y = score_display_y;
var icon_spacing = 100; // Spacing between icons

// Draw carrot icon if active
if (jump_boost) {
    draw_sprite(spr_carrot, 0, icon_x, icon_y);
}

// Draw banana icon if active
if (coin_magnet) {
    draw_sprite(spr_banana, 0, icon_x + (icon_spacing * 0.8), icon_y);
}

// Draw walnut icon if active
if (fall_protection_active) {
    draw_sprite(spr_walnut, 0, icon_x + (icon_spacing * 2), icon_y);
}
