/// @description Insert description here
// You can write your code in this editor
// Draw semi-transparent background
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_alpha(1);

// Set font and color for text
draw_set_font(Font1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw "Paused" text
draw_text(room_width / 2, room_height / 3, "Paused");

// Draw menu options
draw_text(room_width / 2, room_height / 2, "Press ESC to Resume");
draw_text(room_width / 2, room_height / 2 + 50, "Press Q to Quit");
draw_flush()