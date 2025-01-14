/// @description Insert description here
// You can write your code in this editor
if (is_broken) {
    // Count down the timer
    break_timer--;

    // Reappear when the timer reaches 0
    if (break_timer <= 0) {
        is_broken = false; // Mark as active again
        image_alpha = 1; 
		draw_self();
    }
}