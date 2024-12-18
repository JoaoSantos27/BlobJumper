// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load(){
// Load JSON
if(file_exists("game_settings")){
	var game_settings = file_text_open_read("game_settings");
	var save_data = json_decode(file_text_read_string(game_settings));
	var skin_string = ds_map_find_value(save_data, "SelectedSkin");
	global.selected_skin = asset_get_index(skin_string);
	global.tutorial_skin = ds_map_find_value(save_data, "Tutorial");
	global.unlocked_skins = ds_map_find_value(save_data, "UnlockedSkins");
	global.total_coins = ds_map_find_value(save_data, "Coins");
	global.scores = ds_priority_create();
	show_debug_message(ds_map_find_value(save_data, "Scores"));
	ds_priority_read(global.scores, ds_map_find_value(save_data, "Scores"));
	show_debug_message(ds_priority_find_max(global.scores));
	file_text_close(game_settings);
}
}