/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black); // Sets the text color to white
draw_set_font(Font2);

// Draw the score
draw_text(room_width / 2, 400, "Score: " + string(global.final_score));

// Draw the coins collected
draw_text(room_width / 2, 500, "Coins Collected: " + string(global.final_coins));
