/// @description Jump
// You can write your code in this editor
var _screen_width = room_width; 

var _cam = view_camera[0];

camera_set_view_pos(_cam, room_width / 2 - camera_get_view_width(_cam) / 2, y - camera_get_view_height(_cam) / 2);

// Horizontal movement with arrow keys
if (keyboard_check(vk_left)) {
    x -= 10;  // Move left
}

if (keyboard_check(vk_right)) {
    x += 10;  // Move right
}

if (keyboard_check(vk_down)) {
    vspeed = 0;  // Stop jumping (debug for now)
}

// Wrap around when reaching the left or right edge of the screen
if (x < 0 - sprite_width) {
    x = _screen_width;
}

if (x > _screen_width) {
    x = 0 - sprite_width; 
}
// Apply gravity
if (!(place_meeting(x, y+1, obj_platform) || 
place_meeting(x, y+1, obj_platform_breakable) ||
place_meeting(x, y+1, obj_platform_moving) ||
place_meeting(x, y+1, obj_floor))) {
    vspeed += 0.2;  
} else if (vspeed > 0) {
	vspeed = 0; 
    vspeed = -11;  
	if (jump_boost) {
     vspeed = 0; 
     vspeed = -17; 
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

// Vertical movement (falling)
y += vspeed;

if (coin_magnet) {
    with (obj_coin) {
        if (point_distance(x, y, obj_player.x, obj_player.y) < 1000) {
            x += (obj_player.x - x) * 0.1;
            y += (obj_player.y - y) * 0.1;
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
    show_message("Game Over!");  
    game_restart();  
}

if(y < 0) {
	score = -highest_point + coins_collected*1000 + fruits_collected*5000;  
} 