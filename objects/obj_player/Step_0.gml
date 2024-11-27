/// @description Jump
// You can write your code in this editor
var _screen_width = room_width; 

var _cam = view_camera[0];

camera_set_view_pos(_cam, room_width / 2 - camera_get_view_width(_cam) / 2, y - camera_get_view_height(_cam) / 2);

var saved_speed = 0;

if (keyboard_check_pressed(vk_escape)) { // Toggle pause on pressing Escape
    global.is_paused = !global.is_paused; // Switch between true/false
    if (global.is_paused) {
		saved_speed = vspeed;
		vspeed = 0;
        instance_create_layer(0, 0, "Instances", obj_pause_screen); // Create the pause screen
    } else {
        with (obj_pause_screen) instance_destroy(); // Remove pause screen
		vspeed = saved_speed;
    }
}

if (global.is_paused) {
    exit; // Skip further execution if the game is paused
}



// Horizontal movement with arrow keys
if (keyboard_check(vk_left)) {
    x -= 5;  // Move left
	start_moving = true;
}

if (keyboard_check(vk_right)) {
    x += 5;  // Move right
	start_moving = true;
}

// Wrap around when reaching the left or right edge of the screen
if (x < 0 - sprite_width) {
    x = _screen_width;
}

if (x > _screen_width) {
    x = 0 - sprite_width; 
}
// Apply gravity
if(start_moving) {

if (!(place_meeting(x, y+1, obj_platform) || 
place_meeting(x, y+1, obj_platform_breakable) ||
place_meeting(x, y+1, obj_platform_moving) ||
place_meeting(x, y+1, obj_floor))) {
    vspeed += 0.2;  
} else if (vspeed > 0 || place_meeting(x, y+1, obj_floor)) {
	vspeed = 0; 
    vspeed = -11.5;  
	if (jump_boost) {
     vspeed = 0; 
     vspeed = -16; 
	 jump_boost_timer -= 1;
	}
    if (jump_boost_timer <= 0) {
        jump_boost = false;
        vspeed = 0; 
		vspeed = -11;  
    }
	//if (y <= obj_platform.y - 1) { 
	//vspeed = 0;  
    //vspeed = -30; 
	//} else {
	//	vspeed = 35;  
	//}
 } 
}

// Vertical movement (falling)
y += vspeed;

if (coin_magnet) {
    with (obj_coin) {
        if (point_distance(x, y, obj_player.x, obj_player.y) < 500) {
            x += (obj_player.x - x) * 0.05;
            y += (obj_player.y - y) * 0.05;
        }
    }

    coin_magnet_timer -= 1;
    if (coin_magnet_timer <= 0) {
        coin_magnet = false;
    }
}

var _game_over_threshold = highest_point + 3000;

if (fall_protection && fall_protection_active) {
    if (y > _game_over_threshold) { 
        y = highest_point; 
        fall_protection_active = false; 
    }
}

// Update the highest point reached by the player
if (y < highest_point) {
    highest_point = y;
}

if (y > _game_over_threshold) {
    global.final_score = score;
	global.final_coins = coins_collected;
	global.total_coins += coins_collected; // Add coins to the player's total
	show_debug_message("Adding score: " + string(global.final_score));
	ds_priority_add(global.scores, global.final_score, global.final_score)
	show_debug_message("Leaderboard size: " + string(ds_priority_size(global.scores)));
	room_goto(rm_death_screen); // Go to the death screen
}

if(y < 0) {
	score = -highest_point + coins_collected*1000 + fruits_collected*5000;  
} 