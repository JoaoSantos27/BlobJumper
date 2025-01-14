function GlobalVariables(){
	global.final_score = 0;
	global.final_coins = 0;
    global.is_paused = false;
	load();
	if(global.tutorial_skin == undefined) {
		global.tutorial_skin = true
	}
	if(global.selected_skin == undefined) {
		global.selected_skin = spr_player;
	}
	//global.selected_background = "default_background";
	if (global.unlocked_skins==undefined) {
		global.unlocked_skins = ds_list_create();
		ds_list_add(global.unlocked_skins, spr_player);
	}
	//if (global.unlocked_backgrounds!=ds_type_list) {
	//    global.unlocked_backgrounds = ds_list_create();
	//	ds_list_add(global.unlocked_backgrounds, global.selected_background);
	//}
	if(global.total_coins == undefined) {
		global.total_coins = 0; // For coins stored across playthroughs
	}
	if(global.scores == undefined){	
		global.scores = ds_list_create();
	}
	save();
}