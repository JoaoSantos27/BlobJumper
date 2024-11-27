function GlobalVariables(){
	global.final_score = 0;
	global.final_coins = 0;
	global.total_coins = 0; // For coins stored across playthroughs
	global.scores = ds_priority_create();
    global.is_paused = false;
}