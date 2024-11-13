/// @description Insert description here
// You can write your code in this editor

draw_sprite(sprite_index, image_index, x, y);

// Draw the score on the screen
var camera_y = camera_get_view_y(view_camera[0]);
var score_display_y = camera_y + 10;

draw_set_font(Font1);
draw_text(10, score_display_y, "Score: " + string(score));
draw_text(10, score_display_y + 30, "Coins: " + string(coins_collected)); // Show coins collected below the score