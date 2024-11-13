/// @description Insert description here
// You can write your code in this editor
// Move the platform
x += move_speed * move_direction;

// Reverse direction if it moves too far from its starting position
if (abs(x - start_x) >= move_distance) {
    move_direction *= -1; // Change direction
}
