if (global.is_paused) {
    exit; // Skip further execution if the game is paused
}

/// @description Insert description here
// You can write your code in this editor
var coin_distance = irandom_range(500, 2000);

if (obj_player.y < last_coin_y - coin_distance) {
    last_coin_y = obj_player.y;
	//var _i = 0;
	//var _num_coins = 3;//irandom_range(1, 4);
	//while(_i < _num_coins) {
		instance_create_layer(irandom_range(32, room_width - 128), obj_player.y - 2000 + irandom_range(-200, 200), "Instances", obj_coin); // Spawn coin above player
	//	_i =+ 1;
	//}
}
