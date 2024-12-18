/// @description Insert description here
// You can write your code in this editor
var mousex = device_mouse_x_to_gui(0); // Get mouse position in GUI space
var mousey = device_mouse_y_to_gui(0);

// Check for skin selection
for (var i = 0; i < ds_list_size(global.unlocked_skins); i++) {
    var y_pos = y_skins + (i * 220);
    if (mousex > x_start && mousex < x_start + 192 && mousey > y_pos && mousey < y_pos + 192) { 
        show_debug_message("hit");
		if(mouse_check_button_pressed(mb_left)){
			selected_skin_index = i;
			global.selected_skin = ds_list_find_value(global.unlocked_skins, i);
			save();
		}
    }
}

var button_x = x_start + 300;
var button_y = y_skins + 50;
var button_width = 390;
var button_height = 100;
    
if (mousex > button_x && mousex < button_x + button_width &&
	mousey > button_y && mousey < button_y + button_height && mouse_check_button_pressed(mb_left)) {
    // Toggle the boolean
    global.tutorial_skin = !global.tutorial_skin;
	save();
}

// Check for background selection
//var y_backgrounds = 300;
//for (var i = 0; i < ds_list_size(global.unlocked_backgrounds); i++) {
//    var x_pos = x_start + (i * 100);
//    if (mousex > x_pos && mousex < x_pos + 64 && mousey > y_backgrounds && mousey < y_backgrounds + 64) {
//        selected_background_index = i;
//        global.selected_background = ds_list_find_value(global.unlocked_backgrounds, i);
//    }
//}
