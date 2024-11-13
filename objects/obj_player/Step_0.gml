/// @description Jump
// You can write your code in this editor
var _screen_width = room_width;  // Detect the width of the room dynamically

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
    vspeed += 0.4;  
} else if (vspeed > 0) {
	vspeed = 0; 
    vspeed = -16;  
	//if (y <= obj_platform.y - 1) { 
	//vspeed = 0;  
    //vspeed = -30; 
	//} else {
	//	vspeed = 35;  
	//}
}

// Vertical movement (falling)
y += vspeed;

// Update the highest point reached by the player
if (y < highest_point) {
    highest_point = y;
}

// Set a threshold for game over
var _game_over_threshold = highest_point + 3000;

// Trigger game over if player falls below the threshold
if (y > _game_over_threshold) {
    show_message("Game Over!");  // Display a simple game over message
    game_restart();  // Restart the game or load a game-over screen
}

if(y < 0) {
	score = -highest_point + coins_collected*1000;  
} 