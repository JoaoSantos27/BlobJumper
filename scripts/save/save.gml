// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save(){
// Save as JSON
var save_data = ds_map_create();
ds_map_add(save_data,"SelectedSkin", sprite_get_name(global.selected_skin));
ds_map_add(save_data,"Coins", global.total_coins);
ds_map_add(save_data,"Tutorial", global.tutorial_skin);
ds_map_add_list(save_data,"Scores", global.scores);
ds_map_add_list(save_data,"UnlockedSkins", global.unlocked_skins);
var json_string = json_encode(save_data);
var game_settings = file_text_open_write("game_settings");
file_text_write_string(game_settings, json_string);
file_text_close(game_settings);
}