/// @description Insert description here
// You can write your code in this editor
var coin_spawn_distance = 1000; 

if (obj_player.y < last_coin_y - coin_spawn_distance) {
    last_coin_y = obj_player.y;

    instance_create_layer(irandom_range(32, room_width - 32), obj_player.y - 2000, "Instances", obj_coin); // Spawn coin above player
}
