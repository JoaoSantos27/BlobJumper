/// @description Insert description here
// You can write your code in this editor
// Set the distance between coin spawns
var coin_spawn_distance = 3000; // Adjust this to set how often coins spawn

// Check if the player has moved up by the required distance
if (obj_player.y < last_coin_y - coin_spawn_distance) {
    // Update the last coin spawn position
    last_coin_y = obj_player.y;

    // Spawn a coin at a random X position
    instance_create_layer(irandom_range(32, room_width - 32), obj_player.y - 2000, "Instances", obj_coin); // Spawn coin above player
}
